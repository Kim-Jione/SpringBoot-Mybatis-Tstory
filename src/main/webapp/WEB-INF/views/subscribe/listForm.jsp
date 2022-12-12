<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<html lang="ko">
    <head>
        <title>제이스토리</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            rel="stylesheet"
            href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
        />
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
        <link
            href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
            rel="stylesheet"
        />

        <link rel="stylesheet" href="/css/styles.css" />

        <style></style>
    </head>

    <body>
        <div style="height: 120px">
            <input
                type="hidden"
                id="principal-id"
                value="${principal.userId}"
            />
            <nav id="navbar" class="navbar navbar-expand-sm my_navbar">
                <!-- T모양 -->
                <a href="/">
                    <svg
                        class="my_sm_1"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 408.4 408.4"
                    >
                        <g>
                            <circle
                                class="cls-1"
                                cx="58.18"
                                cy="58.18"
                                r="58.18"
                            />
                            <circle
                                class="cls-1"
                                cx="204.2"
                                cy="58.18"
                                r="58.18"
                            />
                            <circle
                                class="cls-1"
                                cx="204.2"
                                cy="204.2"
                                r="58.18"
                            />
                            <circle
                                class="cls-1"
                                cx="204.2"
                                cy="350.22"
                                r="58.18"
                            />
                            <circle
                                class="cls-1"
                                cx="350.22"
                                cy="58.18"
                                r="58.18"
                            />
                        </g>
                    </svg>
                </a>
                <div class="my_navbar_title">
                    <a class="drawer-brand" href="/">제이스토리 </a>
                </div>
                <!-- 페이지 이동 -->
                <div class="dropdown dropleft">
                    <div data-toggle="dropdown">
                        <img id="profileImg"  src="/img/${user.profileImg}" style="width: 80px;height:80px;border-radius: 70%;"> <!-- 사진 사이즈 조절 -->
                    </div>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/s/api/subscribe/listForm"
                            >구독관리</a
                        >
                        <a
                            class="dropdown-item"
                            href="/post/listForm/${principal.userId}"
                            >내블로그</a
                        >
                        <a class="dropdown-item" href="/s/api/user/passwordCheckForm"
                            >계정관리</a
                        >
                        <a class="dropdown-item" href="/s/api/category/writeForm"
                            >카테고리등록</a
                        >
                        <a class="dropdown-item" href="/user/logout"
                            >로그아웃</a
                        >
                    </div>
                </div>
            </nav>
            <br />
        </div>

        <div class="container-fluid">
            <div class="row flex-nowrap">
                <div
                    id="sidebar"
                    class="col-3 bd-sidebar"
                    style="background-color: white; color: black"
                >
                    <div class="bd-sidebar-body">
                        <ul class="nav">
                            <li style="padding-top: 30px;padding-left: 30px;">
                                구독한 블로그 목록
                            </li>
                            <c:forEach var="subscribe" items="${subscribeList}">
                                <li style="padding-left: 30px;padding-top: 10px;">
                                    <a
                                        href="/post/listForm/${subscribe.usersId}"
                                        >${subscribe.nickname} 의 블로그</a
                                    >
                                </li></c:forEach
                            >
                        </ul>
                        <br />
                    </div>
                    <div class="bd-sidebar-footer">
                        <a href="/post/listForm/${principal.userId}"
                            >내블로그 바로가기</a
                        >
                    </div>
                </div>
                <main
                    id="main"
                    class="col-9 py-md-3 pl-md-5 bd-content"
                    role="main"
                >
                    <c:forEach var="post" items="${postList}">
                        <div class="my_post_list_item">
                            <div class="my_post_list_item_left">
                                <img id="profileImg"  src="/img/${post.postThumnail}" style="width: 100%;height:100%;"> <!-- 사진 사이즈 조절 -->
                            </div>
                            <div class="my_post_list_item_right my_ellipsis">
                                <div class="my_text_title my_ellipsis">
                                    ${post.postTitle}
                                </div>
                                <div>${post.createdAt}</div>
                                <a href="/post/listForm/${post.userId}" class="my_atag_none">
                            <div>
                              <span>by ${post.nickname}</span>
                            </div>
                                 </a>
                                <div
                                    class="my_mt_md_1"
                                    style="padding-top: 10px"
                                >
                                    <a
                                        href="/post/detailForm/${post.postId}/${post.userId}"
                                    >
                                        <button
                                            type="button"
                                            class="btn btn-light"
                                            style="border: 2px solid black"
                                            ;line-height:
                                            20px;
                                        >
                                            더보기
                                        </button></a
                                    >
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </main>
            </div>
        </div>

        <script>
            const sidebar = document.getElementById("sidebar");
            const sidebarWidth = sidebar.offsetWidth + "px";
            const navbarHeight = document.getElementById("navbar").offsetHeight;
            window.onscroll = function () {
                const y = window.pageYOffset;
                if (y < navbarHeight) {
                    sidebar.classList.remove("sidebar-full");
                    sidebar.style.height =
                        "calc(100vh - " + (navbarHeight - y + "px)");
                    main.style.marginLeft = "";
                } else {
                    main.style.marginLeft = sidebarWidth;
                    sidebar.classList.add("sidebar-full");
                    sidebar.style.height = "";
                    sidebar.style.width = sidebarWidth;
                }
            };
        </script>
    </body>
</html>
