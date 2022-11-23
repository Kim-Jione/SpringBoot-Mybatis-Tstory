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
        <nav class="drawer-nav my_nav_slider" role="navigation">
            <ul class="drawer-menu">
                <li><a class="drawer-brand" href="/">Home</a></li>
                <li>
                    <a
                        class="drawer-menu-item"
                        href="/post/listForm/${user.userId}"
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

            <div class="my_navbar_title">
                <a href="/post/listForm/${user.userId}"
                    >${user.username}의 블로그</a
                >
            </div>

            <!-- 검색바 -->
            <div class="form-group row justify-content-center">
                <div class="d-flex justify-content-end">
                    <div>
                        <form
                            style="display: inline-flex"
                            method="get"
                            action=""
                        >
                            <input
                                style="width: 150px"
                                class="form-control me-2"
                                type="text"
                                name="keyword"
                            />
                            <button
                                class="btn btn-sm btn-primary"
                                type="submit"
                            >
                                <i class="fa fa-search -retro fa-lg"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- <ul class="navbar-nav">
            <li class="nav-item">
                프로필사진
            </li>
        </ul> -->
        </nav>
        <br />
    </body>
</html>
