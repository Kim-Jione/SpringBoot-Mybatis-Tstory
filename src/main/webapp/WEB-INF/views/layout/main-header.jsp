<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
        />

        <link rel="stylesheet" href="/css/styles.css" />
    </head>

    <body>
        <input type="hidden" id="principal-id" value="" />

        <nav class="navbar navbar-expand-sm my_navbar">
            <a href="/">
                <svg
                    class="my_sm_1"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 408.4 408.4"
                >
                    <g>
                        <circle class="cls-1" cx="58.18" cy="58.18" r="58.18" />
                        <circle class="cls-1" cx="204.2" cy="58.18" r="58.18" />
                        <circle class="cls-1" cx="204.2" cy="204.2" r="58.18" />
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

            <div class="dropdown dropleft">
                <div data-toggle="dropdown">
                    <img
                        id="profile-img-btn"
                        src=""
                        class="my_profile_rounded_img_btn dropdown-toggle"
                    />
                    <img
                        id="profile-img-btn"
                        src="https://i1.sndcdn.com/avatars-000373392764-zp0p80-t500x500.jpg"
                        class="my_profile_rounded_img_btn dropdown-toggle"
                    />
                </div>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/post/list/1">내블로그</a>
                    <a class="dropdown-item" href="/update/1">계정관리</a>
                    <a class="dropdown-item" href="/write/category"
                        >카테고리관리</a
                    >
                    <a class="dropdown-item" href="/logout">로그아웃</a>
                </div>
            </div>

            <div>
                <a class="my_main_start_btn" href="/">시작하기</a>
            </div>
        </nav>
        <br />
    </body>
</html>
