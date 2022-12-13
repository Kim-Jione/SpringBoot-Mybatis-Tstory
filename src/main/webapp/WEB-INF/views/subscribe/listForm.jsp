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
                <c:choose>
                    <c:when test="${user.profileImg==null}">
                        <div class="dropdown dropleft">
                            <div data-toggle="dropdown">
                        <img id="profileImg"  src="data:image/png;base64,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" style="width: 80px;height:80px;border-radius: 70%;"> <!-- 사진 사이즈 조절 -->
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
                </div></c:when>
                    <c:otherwise>
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
            </c:otherwise>
        </c:choose>
                
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
                                구독
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
                                <c:choose>
                        <c:when test="${post.postThumnail==null}"> <img id="profileImg"  src="data:image/jpeg;base64,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" style="width: 100%;height:100%;"> <!-- 사진 사이즈 조절 --></c:when>
                        <c:otherwise> <img id="profileImg"  src="/img/${post.postThumnail}" style="width: 100%;height: 100%;" > <!-- 사진 사이즈 조절 --></c:otherwise>
                    </c:choose>
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
