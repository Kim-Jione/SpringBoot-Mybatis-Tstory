
<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <!-- 레이아웃의 해더 정보 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta name="title" content="회원가입">
    <link rel="stylesheet" href="https://static.msscdn.net/ui/build/m/css/common.css">
    <link rel="stylesheet" href="https://static.msscdn.net/ui/build/m/css/login.css">
    <title>회원가입 | 무신사 스토어</title>

    <!-- import jquery for GA -->
    <script src="https://static.msscdn.net/ui/assets/js/jquery-3.4.1.min.js?202211021806"></script>
    
        <!-- Google Tag Manager -->
        <script>
            var dataLayer = dataLayer || [];
            window.addEventListener("load", function() {
                var memberGA = null;
                if (memberGA != null && memberGA.dimension1 != null) {
                    dataLayer.push(memberGA);
                }

                (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                })(window,document,'script','dataLayer','GTM-TXDSFSF');
            }, false);
        </script>
        <!-- End Google Tag Manager -->

    
    

    <script>
        var THIS_PAGE_GF = "A" ;

        function commonHistoryBack() {
            var isApp = false;
            if (isApp) {
                AppInterface.historyBack();
                return false;
            }
            history.back();
            return false;
        }

    </script>
    <script src="https://static.msscdn.net/static/common-appinterface/release/common-appinterface.js" type="text/javascript"></script>
    <script src="https://static.msscdn.net/static/member/js/member-appinterface.js?202211021806" type="text/javascript"></script>


    <style type="text/css">
        [v-cloak] {
            display: none!important;
        }
    </style>
</head>

<body class="devicePC">
<!-- Container -->
<div class="container login" role="main">
    <!-- ANCHOR Common Appbar -->
    <div id="headerCommonLayout"></div><!-- content -->
    <section class="content content--top">
        <div id="joinContainer" class="login-join-membership">
            <div v-if="hyundaiCardJoin" class="login-join-membership__hyundaicard" v-cloak>
                <svg width="197" height="16" viewBox="0 0 197 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-join-member__hyundaicard__logo">
                    <title>MUSINSA X Hyundai Card</title>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M116.511 4.36373C116.511 1.9584 118.469 0 120.874 0H192.552C194.958 0 196.916 1.9584 196.916 4.36373V16H195.462V4.36373C195.462 2.75787 194.159 1.45547 192.552 1.45547H120.874C119.267 1.45547 117.965 2.75787 117.965 4.36373V16H116.51V4.36373H116.511ZM129.715 13.091C129.838 13.091 129.912 13.0489 129.912 12.9348V5.6441C129.912 5.52997 129.838 5.46864 129.715 5.46864H128.636C128.512 5.46864 128.469 5.52997 128.469 5.6441V8.46544C128.469 8.60037 128.376 8.66277 128.242 8.66277H125.411C125.286 8.66277 125.214 8.60037 125.214 8.46544V5.6441C125.214 5.52997 125.14 5.46864 125.027 5.46864H123.928C123.824 5.46864 123.782 5.52997 123.782 5.6441V12.9348C123.782 13.0489 123.824 13.091 123.928 13.091H125.027C125.14 13.091 125.214 13.0489 125.214 12.9257V9.9897C125.214 9.8553 125.286 9.78277 125.411 9.78277H128.242C128.376 9.78277 128.469 9.8553 128.469 9.9897V12.9257C128.469 13.0489 128.512 13.091 128.636 13.091H129.715ZM132.514 13.1961C131.716 13.1961 131.301 12.5529 131.301 12.0025V7.47184C131.301 7.33584 131.352 7.27344 131.477 7.27344H132.514C132.618 7.27344 132.691 7.33584 132.691 7.47184V11.8484C132.691 11.9726 132.743 12.034 132.888 12.034H134.786C134.91 12.034 134.993 11.9726 134.993 11.8484V7.47184C134.993 7.33584 135.045 7.27344 135.169 7.27344H136.206C136.32 7.27344 136.393 7.33584 136.393 7.47184V14.0772C136.393 14.243 136.34 14.3982 136.269 14.5545L135.563 15.706C135.501 15.8094 135.408 15.8724 135.304 15.8724H135.169C135.045 15.8724 134.993 15.7988 134.993 15.6846V12.7609C134.993 12.6366 134.92 12.5844 134.806 12.6148L132.814 13.1748C132.722 13.1961 132.607 13.1961 132.514 13.1961ZM137.783 11.9924C137.783 12.667 138.344 13.186 138.976 13.186C139.08 13.186 139.194 13.186 139.298 13.1545L141.289 12.6148C141.403 12.5742 141.486 12.6254 141.486 12.7609V12.9268C141.486 13.05 141.527 13.0921 141.652 13.0921H142.689C142.803 13.0921 142.876 13.05 142.876 12.9358V7.47184C142.876 7.33584 142.803 7.27344 142.689 7.27344H141.652C141.527 7.27344 141.486 7.33584 141.486 7.47184V11.8484C141.486 11.9726 141.403 12.0249 141.278 12.0249H139.38C139.235 12.0249 139.173 11.9726 139.173 11.8484V7.47184C139.173 7.33584 139.101 7.27344 139.007 7.27344H137.96C137.835 7.27344 137.783 7.33584 137.783 7.47184V11.9924ZM149.357 8.39279V12.9347C149.357 13.0488 149.284 13.0909 149.17 13.0909H148.133C148.009 13.0909 147.968 13.0488 147.968 12.9256V8.54906C147.968 8.41306 147.884 8.34106 147.76 8.34106H145.862C145.717 8.34106 145.654 8.41306 145.654 8.54906V12.9256C145.654 13.0488 145.582 13.0909 145.489 13.0909H144.441C144.317 13.0909 144.265 13.0488 144.265 12.9347V7.47066C144.265 7.33466 144.317 7.27172 144.441 7.27172H145.489C145.582 7.27172 145.654 7.33466 145.654 7.47066V7.64666C145.654 7.76079 145.706 7.81199 145.862 7.77092L147.843 7.23172C147.873 7.22586 147.902 7.21902 147.931 7.21225C148.002 7.19563 148.071 7.17946 148.145 7.17946C148.829 7.17946 149.357 7.74959 149.357 8.39279ZM154.251 8.55727V11.8463C154.251 11.9706 154.189 12.0229 154.044 12.0229H152.124C151.979 12.0229 151.928 11.9706 151.928 11.8463V8.55727C151.928 8.41274 151.979 8.34074 152.124 8.34074H154.044C154.189 8.34074 154.251 8.41274 154.251 8.55727ZM150.538 9.37879V11.9927C150.538 12.7079 151.201 13.206 151.742 13.1857C151.845 13.1857 151.938 13.1857 152.052 13.1548L154.054 12.6145C154.189 12.574 154.252 12.6257 154.252 12.7607V12.9265C154.252 13.0497 154.303 13.0924 154.407 13.0924H155.464C155.589 13.0924 155.64 13.0497 155.64 12.9361V4.95052C155.64 4.83692 155.589 4.75425 155.464 4.75425H154.407C154.303 4.75425 154.252 4.83692 154.252 4.95052V7.09772C154.252 7.22145 154.189 7.27318 154.054 7.27318H153.1C152.83 7.27318 152.601 7.33558 152.374 7.48172L151.275 8.12385C150.777 8.39372 150.538 8.81932 150.538 9.37879ZM160.535 11.8464V8.55732C160.535 8.41279 160.462 8.34079 160.328 8.34079H158.408C158.263 8.34079 158.212 8.41279 158.212 8.55732V11.8464C158.212 11.9707 158.263 12.0229 158.408 12.0229H160.328C160.462 12.0229 160.535 11.9707 160.535 11.8464ZM158.026 13.1855C157.372 13.1855 156.822 12.6564 156.822 11.9924V9.37858C156.822 8.81911 157.061 8.39351 157.548 8.12364L158.658 7.48151C158.886 7.33538 159.114 7.27298 159.373 7.27298H161.748C161.862 7.27298 161.924 7.33538 161.924 7.47138V12.9359C161.924 13.0495 161.862 13.0922 161.748 13.0922H160.691C160.577 13.0922 160.536 13.0495 160.536 12.9263V12.7604C160.536 12.6255 160.462 12.5738 160.328 12.6143L158.336 13.1546C158.222 13.1855 158.129 13.1855 158.026 13.1855ZM164.527 13.0917C164.631 13.0917 164.704 13.0496 164.704 12.9355V7.47093C164.704 7.33546 164.631 7.27253 164.527 7.27253H163.491C163.355 7.27253 163.314 7.33546 163.314 7.47093V12.9355C163.314 13.0496 163.355 13.0917 163.491 13.0917H164.527ZM164.528 5.96659C164.632 5.96659 164.704 5.92606 164.704 5.80126V4.95059C164.704 4.83646 164.632 4.75379 164.528 4.75379H163.491C163.355 4.75379 163.314 4.83646 163.314 4.95059V5.80126C163.314 5.92606 163.355 5.96659 163.491 5.96659H164.528ZM167.612 11.5972V7.66703C167.612 7.08624 167.862 6.63983 168.369 6.33957L169.583 5.6649C169.801 5.52997 170.06 5.46864 170.299 5.46864H172.871C172.996 5.46864 173.057 5.52997 173.057 5.65477V6.4121C173.057 6.5257 172.996 6.57744 172.871 6.57744H169.272C169.147 6.57744 169.096 6.65103 169.096 6.7849V11.7849C169.096 11.9188 169.147 11.9812 169.272 11.9812H172.974C173.089 11.9812 173.161 12.0324 173.161 12.1374C173.161 12.2516 173.11 12.3438 172.996 12.4068L172.103 12.9044C171.865 13.0393 171.616 13.091 171.367 13.091H169.127C168.391 13.091 167.612 12.562 167.612 11.5972ZM177.736 8.55732V11.8464C177.736 11.9707 177.664 12.0229 177.528 12.0229H175.61C175.465 12.0229 175.413 11.9707 175.413 11.8464V8.55732C175.413 8.41279 175.465 8.34079 175.61 8.34079H177.528C177.664 8.34079 177.736 8.41279 177.736 8.55732ZM174.023 11.9924C174.023 12.6564 174.572 13.1855 175.227 13.1855C175.33 13.1855 175.423 13.1855 175.537 13.1546L177.528 12.6143C177.664 12.5738 177.736 12.6255 177.736 12.7604V12.9263C177.736 13.0495 177.778 13.0922 177.892 13.0922H178.949C179.064 13.0922 179.125 13.0495 179.125 12.9359V7.47138C179.125 7.33538 179.064 7.27298 178.949 7.27298H176.574C176.315 7.27298 176.087 7.33538 175.858 7.48151L174.749 8.12364C174.262 8.39351 174.023 8.81911 174.023 9.37858V11.9924ZM184.332 8.18595C184.332 8.28942 184.258 8.34169 184.144 8.34169H182.101C181.967 8.34169 181.915 8.41369 181.915 8.54969V12.9262C181.915 13.0494 181.832 13.0916 181.728 13.0916H180.681C180.556 13.0916 180.515 13.0494 180.515 12.9353V7.47129C180.515 7.33529 180.556 7.27289 180.681 7.27289H181.728C181.832 7.27289 181.915 7.33529 181.915 7.47129V7.63662C181.915 7.75075 181.967 7.80195 182.101 7.80195C182.132 7.80195 182.175 7.80195 182.215 7.78169L182.818 7.38755C183.035 7.27289 183.263 7.21209 183.532 7.21209H184.144C184.258 7.21209 184.332 7.27289 184.332 7.38755V8.18595ZM188.253 8.55727V11.8463C188.253 11.9706 188.191 12.0229 188.046 12.0229H186.127C185.982 12.0229 185.93 11.9706 185.93 11.8463V8.55727C185.93 8.41274 185.982 8.34074 186.127 8.34074H188.046C188.191 8.34074 188.253 8.41274 188.253 8.55727ZM184.54 9.37879V11.9927C184.54 12.7079 185.204 13.206 185.743 13.1857C185.848 13.1857 185.94 13.1857 186.054 13.1548L188.055 12.6145C188.191 12.574 188.253 12.6257 188.253 12.7607V12.9265C188.253 13.0497 188.305 13.0924 188.409 13.0924H189.466C189.591 13.0924 189.642 13.0497 189.642 12.9361V4.95052C189.642 4.83692 189.591 4.75425 189.466 4.75425H188.409C188.305 4.75425 188.253 4.83692 188.253 4.95052V7.09772C188.253 7.22145 188.191 7.27318 188.055 7.27318H187.101C186.832 7.27318 186.604 7.33558 186.375 7.48172L185.277 8.12385C184.779 8.39372 184.54 8.81932 184.54 9.37879ZM96.7916 7.99817L102.212 2.57844C102.257 2.53364 102.257 2.50057 102.204 2.44724L101.793 2.03657C101.752 1.99604 101.707 1.98324 101.661 2.02911L96.2423 7.44777L90.8386 2.04511C90.7852 1.99177 90.7319 1.99604 90.6903 2.03657L90.2807 2.44724C90.2268 2.50057 90.2359 2.54164 90.2892 2.59497L95.6919 7.99817L90.2892 13.3998C90.2359 13.4542 90.2391 13.507 90.2807 13.548L90.6903 13.9587C90.7447 14.012 90.7852 14.0035 90.8386 13.9512L96.2423 8.54751L101.661 13.9667C101.707 14.012 101.74 14.012 101.793 13.9587L102.204 13.548C102.244 13.507 102.257 13.4622 102.212 13.4174L96.7916 7.99817ZM35.1872 10.8897C35.1872 9.57857 34.3947 9.28495 33.0183 8.77501L32.8272 8.70412L31.9424 8.37132C30.9648 8.00065 30.3014 7.64919 29.8214 7.05665C29.343 6.46412 29.0475 5.79745 29.0475 4.87158C29.0475 3.20492 30.2827 1.33398 32.9744 1.33398C35.4454 1.33398 36.9392 2.83425 36.9392 5.20492H34.9846V4.96385C34.9846 3.77878 34.1547 3.13078 32.9744 3.13078C31.776 3.13078 31.0016 3.77878 31.0016 4.83425C31.0016 5.76012 31.5179 6.22305 33.1403 6.83425L33.8779 7.11212C35.0214 7.53825 35.7035 7.90839 36.2566 8.50092C36.8096 9.09345 37.1414 9.76012 37.1414 10.8156C37.1414 12.8711 35.4267 14.6673 32.9931 14.6673C30.5963 14.6673 28.7339 13.1495 28.7339 10.5191H30.6886V10.7047C30.6886 12.0567 31.6475 12.8711 32.9931 12.8711C34.3392 12.8711 35.1872 12.0935 35.1872 10.8897ZM6.82187 9.0574L11.4677 1.52034H13.6619V14.483H11.8181V4.26114L7.66933 10.9838H5.97333L1.84373 4.26114V14.483H0V1.52034H2.1936L6.82187 9.0574ZM24.668 1.52057V9.0571C24.668 11.4091 23.4509 12.8534 21.4968 12.8534C19.5426 12.8534 18.3256 11.4091 18.3256 9.0571V1.52057H16.4637V9.03843C16.4637 12.5755 18.4733 14.6683 21.4968 14.6683C24.5202 14.6683 26.5304 12.5755 26.5304 9.03843V1.52057H24.668ZM41.369 14.4832H39.4885V1.52057H41.369V14.4832ZM46.0712 4.4462V14.483H44.2275V1.52034H46.2739L53.0035 11.6131V1.52034H54.8472V14.483H52.7821L46.0712 4.4462ZM61.338 8.77533C62.7135 9.28507 63.5062 9.57884 63.5062 10.8897C63.5062 12.0935 62.6582 12.8711 61.312 12.8711C59.9659 12.8711 59.0075 12.0567 59.0075 10.7047V10.5191H57.0528C57.0528 13.1495 58.9158 14.6673 61.312 14.6673C63.7456 14.6673 65.4608 12.8711 65.4608 10.8156C65.4608 9.76012 65.1286 9.09345 64.5755 8.50092C64.023 7.90839 63.3403 7.53825 62.1968 7.11212L61.4598 6.83425C59.8368 6.22305 59.3206 5.76012 59.3206 4.83425C59.3206 3.77878 60.095 3.13078 61.2939 3.13078C62.4736 3.13078 63.3035 3.77878 63.3035 4.96385V5.20492H65.2582C65.2582 2.83425 63.7643 1.33398 61.2939 1.33398C58.6017 1.33398 57.3664 3.20492 57.3664 4.87158C57.3664 5.79745 57.6619 6.46412 58.1409 7.05665C58.6203 7.64919 59.2838 8.00065 60.2614 8.37132L61.1462 8.70412L61.338 8.77533ZM75.4304 10.8723H69.6779L68.2214 14.483H66.3222L71.5397 1.52034H73.568L78.7861 14.483H76.8869L75.4304 10.8723ZM72.5526 3.74306L70.4139 9.03906H74.6913L72.5526 3.74306Z" fill="#000001" />
                </svg>
            </div>
            <div class="login-join-membership__form">
                <div class="login-input">
                    <label for="loginJoinMembershipId" class="login-input__label">아이디 <span class="login-input__label__essential">필수 입력</span>
                    </label>
                    <div class="login-input__wrap" :class="{'login-input__danger': memberIdValid == false }">
                        <input v-model="memberId" ref="memberId" type="text" id="loginJoinMembershipId" class="login-input__input" placeholder="영문, 숫자 5-11자" maxlength="11">
                        <button v-show="memberId" type="button" class="login-input__button-clear" @click="memberId = ''; $refs.memberId.focus();">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-input__button-clear__svg">
                                <title>입력한 내용 삭제</title>
                                <circle cx="10" cy="10" r="10" fill="#B3B3B3" />
                                <path d="M5.52786 5.52742L14.4722 14.4718M14.4722 5.52734L5.52783 14.4717" stroke="white" />
                            </svg>
                        </button>
                    </div>
                    <p v-show="memberIdValidMessage" :class="[memberIdValid ? 'login-input__helper-text--blue' : 'login-input__validation']" v-cloak>{{ memberIdValidMessage }}</p>
                </div>
                <div class="login-input" v-if="!passwordCheckPass">
                    <label for="loginJoinMembershipPassword1" class="login-input__label">비밀번호 <span class="login-input__label__essential">필수 입력</span>
                    </label>
                    <div class="login-input__wrap" :class="{'login-input__danger': passwordValid == false }">
                        <input v-model="password" ref="password" :type="[showPassword ? 'text' : 'password']" id="loginJoinMembershipPassword1" class="login-input__input" placeholder="숫자, 영문, 특수문자 조합 최소 8자" maxlength="30">
                        <button v-show="password" type="button" class="login-input__button-clear" @click="password=''; $refs.password.focus();">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-input__button-clear__svg">
                                <title>입력한 내용 삭제</title>
                                <circle cx="10" cy="10" r="10" fill="#B3B3B3" />
                                <path d="M5.52786 5.52742L14.4722 14.4718M14.4722 5.52734L5.52783 14.4717" stroke="white" />
                            </svg>
                        </button>
                        <button type="button" class="login-input__button-eye" :class="{'login-input__button-eye--active': showPassword}" :aria-label="[showPassword ? '비밀번호 보이기' : '비밀번호 숨기기']" @click="showPassword=!showPassword"></button>
                    </div>
                    <p v-show="!passwordValid" class="login-input__validation" v-cloak>{{ passwordValidMessage }}</p>
                </div>
                <div class="login-input" v-if="!passwordCheckPass">
                    <div class="login-input__wrap" :class="{'login-input__danger': passwordConfirmValid == false }">
                        <input v-model="passwordConfirm" ref="passwordConfirm" :type="[showPasswordConfirm ? 'text' : 'password']" id="loginJoinMembershipPassword2" class="login-input__input" title="비밀번호 재입력" placeholder="비밀번호 재입력" maxlength="30">
                        <button v-show="passwordConfirm" type="button" class="login-input__button-clear" @click="passwordConfirm = ''; $refs.passwordConfirm.focus();">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-input__button-clear__svg">
                                <title>입력한 내용 삭제</title>
                                <circle cx="10" cy="10" r="10" fill="#B3B3B3" />
                                <path d="M5.52786 5.52742L14.4722 14.4718M14.4722 5.52734L5.52783 14.4717" stroke="white" />
                            </svg>
                        </button>
                        <button type="button" class="login-input__button-eye" :class="{'login-input__button-eye--active': showPasswordConfirm}" :aria-label="[showPasswordConfirm ? '비밀번호 보이기' : '비밀번호 숨기기']" @click="showPasswordConfirm=!showPasswordConfirm"></button>
                    </div>
                    <p v-show="!passwordConfirmValid" class="login-input__validation" v-cloak>{{ passwordConfirmValidMessage }}</p>
                </div>
                <div class="login-input" :class="{'login-input--layer': emailDomainAutoCompleteList.length > 0 }">
                    <label for="loginJoinMembershipEmail" class="login-input__label">이메일 <span class="login-input__label__essential">필수 입력</span>
                    </label>
                    <div class="login-input__wrap" :class="{'login-input__danger': emailValid == false }">
                        <input v-model="email" ref="email" type="email" id="loginJoinMembershipEmail" class="login-input__input">
                        <button v-show="email" type="button" class="login-input__button-clear" @click="email = ''; $refs.email.focus();">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-input__button-clear__svg">
                                <title>입력한 내용 삭제</title>
                                <circle cx="10" cy="10" r="10" fill="#B3B3B3" />
                                <path d="M5.52786 5.52742L14.4722 14.4718M14.4722 5.52734L5.52783 14.4717" stroke="white" />
                            </svg>
                        </button>
                    </div>
                    <p v-show="emailValidMessage" :class="[emailValid ? 'login-input__helper-text--blue' : 'login-input__validation']" v-cloak>{{ emailValidMessage }}</p>
                    <p class="login-input__helper-text">계정 분실 시 본인인증 정보로 활용됩니다.</p>
                    <ul class="login-input__layer-list">
                        <li v-for="autoComplete in emailDomainAutoCompleteList" class="login-input__layer-list__item">
                            <button type="button" class="login-input__layer-list__button" @click="email=autoComplete.beforeAt+autoComplete.domain">
                                <span class="login-input__layer-list__mail-account" v-cloak>{{ autoComplete.beforeAt }}</span>
                                <em class="login-input__layer-list__mail-domain" v-cloak>{{ autoComplete.domain }}</em>
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="login-input">
                    <label for="loginJoinMembershipFriend" class="login-input__label">친구 초대 추천인 아이디</label>
                    <div class="login-input__wrap" :class="{'login-input__danger': recommendMemberIdValid == false }">
                        <input v-model="recommendMemberId" ref="recommendMemberId" type="text" id="loginJoinMembershipFriend" class="login-input__input" value="as">
                        <button v-show="recommendMemberId" type="button" class="login-input__button-clear" @click="recommendMemberId = ''; $refs.recommendMemberId.focus();">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-input__button-clear__svg">
                                <title>입력한 내용 삭제</title>
                                <circle cx="10" cy="10" r="10" fill="#B3B3B3" />
                                <path d="M5.52786 5.52742L14.4722 14.4718M14.4722 5.52734L5.52783 14.4717" stroke="white" />
                            </svg>
                        </button>
                    </div>
                    <p v-html="recommendMemberIdValidMessage" v-show="recommendMemberIdValidMessage" :class="[recommendMemberIdValid ? 'login-input__helper-text--blue' : 'login-input__validation']"></p>
                </div>
                <div v-if="!kakaoJoin" class="login-join-membership__form__agreement" v-cloak>
                    <div class="login-checkbox login-join-membership__all-checkbox">
                        <input v-model="agreeAll" type="checkbox" id="loginJoinMembershipAllCheckbox" name="loginJoinMembershipAllCheckbox" class="blind" @click="turnAllTerms(!agreeAll)">
                        <label for="loginJoinMembershipAllCheckbox" class="login-checkbox__label login-join-membership__all-checkbox__label">약관 전체 동의하기</label>
                    </div>
                    <div class="login-checkbox--version login-join-membership__checkbox">
                        <input v-model="privacyAgree" type="checkbox" id="privacyAgreeCheckbox" name="privacyAgreeCheckbox" class="blind">
                        <label for="privacyAgreeCheckbox" class="login-checkbox--version__label login-join-membership__checkbox__label">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-checkbox--version__svg">
                                <title></title>
                                <path d="M2.6665 8L6.39952 11.7333L13.8665 4.26666" stroke="#D1D1D1" stroke-width="1.5" stroke-linecap="square" class="svg-color" />
                            </svg> [필수] 개인정보 수집 및 이용 동의
                        </label>
                        <button @click="popUpForTerms('/member/join/agreement/privacy-usage')" class="login-checkbox--version__link">자세히</button>
                    </div>
                    <div class="login-checkbox--version login-join-membership__checkbox">
                        <input v-model="useTermsAgree" type="checkbox" id="useTermsAgreeCheckbox" name="useTermsAgreeCheckbox" class="blind">
                        <label for="useTermsAgreeCheckbox" class="login-checkbox--version__label login-join-membership__checkbox__label">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-checkbox--version__svg">
                                <title></title>
                                <path d="M2.6665 8L6.39952 11.7333L13.8665 4.26666" stroke="#D1D1D1" stroke-width="1.5" stroke-linecap="square" class="svg-color" />
                            </svg> [필수] 무신사, 무신사 스토어 이용 악관
                        </label>
                        <button @click="popUpForTerms('/member/join/agreement/service')" class="login-checkbox--version__link">자세히</button>
                    </div>
                    <div class="login-checkbox--version login-join-membership__checkbox">
                        <input v-model="over14Agree" type="checkbox" id="over14AgreeCheckbox" name="over14AgreeCheckbox" class="blind">
                        <label for="over14AgreeCheckbox" class="login-checkbox--version__label login-join-membership__checkbox__label">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-checkbox--version__svg">
                                <title></title>
                                <path d="M2.6665 8L6.39952 11.7333L13.8665 4.26666" stroke="#D1D1D1" stroke-width="1.5" stroke-linecap="square" class="svg-color" />
                            </svg> [필수] 만 14세 미만 가입 제한
                        </label>
                    </div>
                    <div class="login-checkbox--version login-join-membership__checkbox">
                        <input v-model="marketingReceiveAgree" type="checkbox" id="marketingReceiveAgreeCheckbox" name="marketingReceiveAgreeCheckbox" class="blind">
                        <label for="marketingReceiveAgreeCheckbox" class="login-checkbox--version__label login-join-membership__checkbox__label">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="login-checkbox--version__svg">
                                <title></title>
                                <path d="M2.6665 8L6.39952 11.7333L13.8665 4.26666" stroke="#D1D1D1" stroke-width="1.5" stroke-linecap="square" class="svg-color" />
                            </svg> [선택] 마케팅 활용 및 광고성 정보 수신 동의
                        </label>
                        <button @click="popUpForTerms('/member/join/agreement/marketing')" class="login-checkbox--version__link">자세히</button>
                    </div>
                </div>
            </div>
            <div class="login-button login-button--static" v-cloak>
                <button v-if="kakaoJoin" type="submit" class="login-button__item login-button__item--blue" :disabled="!readyToJoin || joinButtonClicked" @click="join()">카카오 간편 가입 완료</button>
                <button v-else type="submit" class="login-button__item login-button__item--blue" :disabled="!readyToJoin || joinButtonClicked" @click="join()"
                        data-amp-event-type="click"
                        data-amp-event-name="click_button"
                        data-amp-properties=' { &quot;from&quot;: &quot;screen_login&quot;, &quot;to&quot;: &quot;screen_join_complete&quot;, &quot;section_name&quot;: &quot;member&quot;, &quot;url&quot;: &quot;https://www.musinsa.com/member/join/complete&quot;, &quot;button_name&quot;: &quot;join&quot; } '>
                    본인인증하고 가입하기</button>
            </div>
            <ul class="login-join-membership__guide-list" v-cloak>
                <li v-if="hyundaiCardJoin" class="login-join-membership__guide-list__normal">카드 발급은 만 19세 이상만 가능합니다.</li>
                <li v-if="!hyundaiCardJoin && !kakaoJoin && !app" class="login-join-membership__guide-list__normal">본인인증이 어려운 경우(만 14세 미만 포함), <a :href="linkForNonMember" class="login-join-membership__guide-list__link">비회원으로 구매</a>할 수 있습니다.</li>
            </ul>
        </div>
    </section><!-- //content -->
    <!-- ANCHOR Common Layout Start -->
    <div id="commonLayoutFooter"></div>
    <script type="text/javascript" src="https://static.msscdn.net/static/common/2.2.0/cl-mobile.js"></script>
    <script>
        (function(){
            const commonlayoutOption = {
                titleType: 'main',
                titleText: '회원가입',
                useAppbarButtonBack: true,
                useMenubarBottom: false,
            }

            const isAppleJoin = "SELF_CERTIFY" == "APPLE";
            if (isAppleJoin) {
                commonlayoutOption.titleType = 'text'
                commonlayoutOption.titleText = "Apple 계정으로 회원가입"
            }
            window.commonLayout.render('', '#headerCommonLayout', commonlayoutOption);
        })();
    </script><!-- ANCHOR Common Layout End -->
</div><!-- //Container -->
</body>
<script type="text/javascript" src="https://static.msscdn.net/static/member/js/lodash-4.17.21.min.js"></script>
<script type="text/javascript" src="https://static.msscdn.net/static/member/js/vue-2.6.14.js"></script>
<script type="text/javascript" src="https://static.msscdn.net/static/member/js/axios-0.25.0.min.js"></script>
<script type="text/javascript">

    (function () {
        AppInterface.sendScreenEvent(
            'screen_member_join', {
                from: 'screen_member_join'
            }
        );

        const mypageUrl = "https://my.musinsa.com"
        let selfVerificationWindow = null
        let windowCheckTimer = null

        function checkSelfVerificationWindow() {
            if (selfVerificationWindow.closed) {
                vue.joinButtonClicked = false
                clearInterval(windowCheckTimer)
            }
        }

        const vue = new Vue({
            el: "#joinContainer",
            data: {
                memberId: "",
                memberIdValid: null,
                memberIdValidMessage: "",
                email: "",
                emailValid: null,
                emailValidMessage: "",
                password: "",
                passwordValid: null,
                passwordValidMessage: "",
                passwordConfirm: "",
                passwordConfirmValid: null,
                passwordConfirmValidMessage: "",
                recommendMemberId: "",
                recommendMemberIdValid: null,
                recommendMemberIdValidMessage: "",
                showPassword: false,
                showPasswordConfirm: false,
                agreeAll: false,
                privacyAgree: false,
                useTermsAgree: false,
                over14Agree: false,
                marketingReceiveAgree: false,
                joinButtonClicked: false,
                app: false,
                joinType: "",
                kakaoJoin: false,
                passwordCheckPass: false,
                hyundaiCardJoin: false,
                emailDomainList: ["naver.com", "gmail.com", "hanmail.net", "nate.com", "daum.net"],
                friendInviteEventChannel: ""
            },
            mounted () {
                this.app = "false" === "true"
                this.joinType = "SELF_CERTIFY"
                this.hyundaiCardJoin = "false" === "true"
                this.recommendMemberId = ""
                this.friendInviteEventChannel = ""
                this.email = ""
                this.kakaoJoin = this.joinType === "KAKAO"
                this.passwordCheckPass = this.joinType == "APPLE"
                if (this.passwordCheckPass) {
                    this.passwordValid = true
                    this.passwordConfirmValid = true
                }
            },
            methods: {
                checkEmailValid: function (email) {
                    const re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/
                    return re.test(email)
                },
                checkMemberIdValid: function (memberId) {
                    const re = /^[\da-z_]{5,11}$/
                    return re.test(memberId)
                },
                checkPasswordValid: function (password) {
                    const re = /^[a-zA-Z\d\{\}\[\]\/?.,;:|\)*~`!^\-_+<>₩@\#$%&\\\=\(\'\"]{8,30}$/
                    const alphabet = /[a-zA-Z]/
                    const digit = /\d/
                    const specialCharacter = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>₩@\#$%&\\\=\(\'\"]/
                    const duplication = /([a-zA-Z\d\{\}\[\]\/?.,;:|\)*~`!^\-_+<>₩@\#$%&\\\=\(\'\"])\1\1\1/

                    if (duplication.test(password)) {
                        return { valid: false, message: "동일문자를 반복해서 4자 이상 사용할 수 없습니다." }
                    }

                    let count = alphabet.test(password) + digit.test(password) + specialCharacter.test(password)
                    if (count < 2 ) {
                        return { valid: false, message: "숫자, 영문 대소문자, 특수문자 중 두가지 이상으로 조합해 주십시오." }
                    }

                    if (!re.test(password)) {
                        return { valid: false, message: "숫자, 영문 대소문자, 특수문자 중 두가지 이상으로 조합해 주십시오." }
                    }

                    return { valid: true, message: "" }
                },
                checkPasswordConfirmValid: function (_password, _passwordConfirm) {
                    if (_password === _passwordConfirm) {
                        vue.passwordConfirmValid = true
                        vue.passwordConfirmValidMessage = ""
                    } else {
                        vue.passwordConfirmValid = false
                        vue.passwordConfirmValidMessage = "비밀번호가 일치하지 않습니다."
                    }
                },
                turnAllTerms: function (value) {
                    if (value) {
                        vue.privacyAgree = true
                        vue.useTermsAgree = true
                        vue.over14Agree = true
                        vue.marketingReceiveAgree = true
                    } else {
                        vue.privacyAgree = false
                        vue.useTermsAgree = false
                        vue.over14Agree = false
                        vue.marketingReceiveAgree = false
                    }
                },
                checkAllTermsTrue: function () {
                    vue.agreeAll = (vue.privacyAgree && vue.useTermsAgree && vue.over14Agree && vue.marketingReceiveAgree);
                },
                toFormData: function (obj) {
                    const formData = new FormData()
                    for (const [key, value] of Object.entries(obj)) {
                        formData.append(key, value)
                    }
                    return formData
                },
                getRecommendMemberIdValid: function () {
                    return !(this.recommendMemberId !== '' && this.recommendMemberIdValid === false)
                },
                getFriendInviteChannel : function () {
                    if (vue.friendInviteEventChannel == '' && this.getRecommendMemberIdValid()) {
                        return "FRIEND_INVITE";
                    }

                    return vue.friendInviteEventChannel;
                },
                join: function () {

                    this.joinButtonClicked = true

                    selfVerificationWindow = window.open("", "popupChk", "width=410, height=715")

                    axios.post(
                        mypageUrl + "/api/member/v2/join/verify",
                        this.toFormData({
                                "memberId": vue.memberId,
                                "password": vue.password,
                                "confirmPassword": vue.passwordConfirm,
                                "email": vue.email.toLowerCase(),
                                "recommendMemberId": vue.recommendMemberId,
                                "friendInviteEventChannel": vue.getFriendInviteChannel(),
                                "agreeCheckbox": vue.privacyAgree,
                                "ageAgreeCheckbox": vue.over14Agree,
                                "useTermsCheckbox": vue.useTermsAgree,
                                "marketingReceiveAgreeYn": vue.marketingReceiveAgree,
                                "checkMemberId": vue.memberIdValid,
                                "checkPassword": vue.passwordValid,
                                "checkConfirmPassword": vue.passwordConfirmValid,
                                "checkEmail": vue.emailValid,
                                "checkRecommendMemberId": vue.getRecommendMemberIdValid(),
                                "checkPhoneNumber": "0",
                                "referer": "https://www.musinsa.com/auth/login?referer=https%3A%2F%2Fwww.musinsa.com%2Fapp%2F",
                                "eventToken": "",
                                "snsToken": "",
                                "partnerCode": "",
                                "eventPage": "",
                                "eventCode": "",
                                "returnUrl": "",
                                "joinType": vue.joinType
                            }),
                    )
                        .then((response) => {
                            const data = response.data
                            if (!data.success) {
                                this.joinButtonClicked = false
                                selfVerificationWindow.close()
                                return false
                            }

                            if (vue.kakaoJoin) {
                                selfVerificationWindow.close()
                                location.href = "/member/join/complete?joinDataToken=" + data.joinDataToken
                                return true
                            }

                            const connectUrl = "https://www.musinsa.com/member/selfcertify/connect?redirectUrl=/member/join&pageCode=005&selfCertifyFlag=" + "KMC&joinDataToken=" + data.joinDataToken

                            if (selfVerificationWindow) {
                                selfVerificationWindow.location = connectUrl
                                windowCheckTimer = setInterval(checkSelfVerificationWindow, 500)
                            } else {
                                this.joinButtonClicked = false
                                return false
                            }

                            return true
                        })
                        .catch((error) => {
                            selfVerificationWindow.close()
                            alert("요청에 실패했습니다. 다시 시도해 주세요.")
                            this.joinButtonClicked = false
                            return false
                        })
                },
                popUpForTerms: function (url) {
                    const popSizeOnMobile = vue.app ? "width=100%,height=100%," : "width=410,height=715,"
                    window.open(url, "popupChk", popSizeOnMobile + "statusbar=no,scrollbars=yes,toolbar=no");
                },
            },
            watch: {
                memberId: _.debounce(function (value) {
                    if (value.length < 1) {
                        vue.memberIdValid = false
                        vue.memberIdValidMessage = "아이디는 필수정보 입니다."
                        return false;
                    }

                    if (value.length < 5) {
                        vue.memberIdValid = false
                        vue.memberIdValidMessage = "아이디는 5자 이상이어야 합니다."
                        return false;
                    }

                    if (!vue.checkMemberIdValid(value)) {
                        vue.memberIdValid = false;
                        vue.memberIdValidMessage = "아이디는 영문소문자, 숫자, 특수기호(_)만 사용 가능합니다."
                        return false
                    }

                    axios.post(mypageUrl + "/api/member/v2/join/memberId/exist", {memberId: value})
                        .then(function (response) {
                            const data = response.data
                            vue.memberIdValid = data.success
                            vue.memberIdValidMessage = data.message
                        })
                        .catch(function (data) {
                            vue.memberIdValidMessage = "요청에 실패했습니다. 다시 시도해 주세요."
                            vue.memberIdValid = false
                        });
                }, 300),
                email: _.debounce(function (value) {

                    if (value.length < 1) {
                        vue.emailValid = false;
                        vue.emailValidMessage = "이메일은 필수정보 입니다."
                        return false;
                    }

                    if (!vue.checkEmailValid(value)) {
                        vue.emailValid = false;
                        vue.emailValidMessage = "이메일 주소가 올바르지 않습니다."
                        return false;
                    }

                    axios.post(mypageUrl + "/api/member/v2/join/email/exist", {email: value.toLowerCase()})
                        .then(function (response) {
                            const data = response.data
                            vue.emailValid = data.success
                            vue.emailValidMessage = data.message
                        })
                        .catch(function (data) {
                            vue.emailValidMessage = "요청에 실패했습니다. 다시 시도해 주세요."
                            vue.emailValid = false
                        });
                }, 300),
                password: _.debounce(function (value) {
                    if (vue.passwordCheckPass) {
                        return false;
                    }

                    if (vue.passwordConfirmValid != null) {
                        vue.checkPasswordConfirmValid(value, vue.passwordConfirm)
                    }

                    if (value.length < 1) {
                        vue.passwordValid = false
                        vue.passwordValidMessage = "비밀번호는 필수정보 입니다."
                        return false;
                    }

                    if (value.length < 8 || value.length > 30) {
                        vue.passwordValid = false
                        vue.passwordValidMessage = "8~30자 이내로 입력해 주십시오."
                        return false;
                    }

                    let validResult = vue.checkPasswordValid(value)
                    vue.passwordValid = validResult.valid
                    vue.passwordValidMessage = validResult.message

                    if (!validResult.valid) {
                        return false;
                    }

                    axios.post(mypageUrl + "/api/member/v2/join/validation/password", {password: value})
                        .then(function (response) {
                            const data = response.data
                            vue.passwordValid = data.success
                            vue.passwordValidMessage = data.message
                        })
                        .catch(function (data) {
                            vue.passwordValidMessage = "요청에 실패했습니다. 다시 시도해 주세요."
                            vue.passwordValid = false
                        });
                }, 300),
                passwordConfirm: function (value) {
                    if (vue.passwordCheckPass) {
                        return false;
                    }

                    if (value.length < 1) {
                        vue.passwordConfirmValid = false
                        vue.passwordConfirmValidMessage = "비밀번호 재확인은 필수정보입니다."
                        return false
                    }

                    vue.checkPasswordConfirmValid(vue.password, value)
                },
                recommendMemberId: _.debounce(function (value) {
                    if (value.length < 1) {
                        vue.recommendMemberIdValid = true
                        vue.recommendMemberIdValidMessage = ""
                        return false;
                    }

                    if (value.length < 4) {
                        vue.recommendMemberIdValid = false
                        vue.recommendMemberIdValidMessage = "아이디는 4자 이상이어야 합니다."
                        return false;
                    }

                    axios.post(mypageUrl + "/api/member/v2/join/verify/recommend-member-id", {recommendMemberId: value})
                        .then(function (response) {
                            const data = response.data
                            vue.recommendMemberIdValid = data.success
                            if (data.success === true) {
                                vue.recommendMemberIdValidMessage = "추천인 아이디입니다. 가입 후 추천인과 신규회원 모두 적립금 1,000원을 드립니다"
                            } else {
                                vue.recommendMemberIdValidMessage = "추천인 아이디를 확인해주세요.<br>추천인은 친구 초대 이벤트에 참여한 이력이 있어야 합니다.<br>(참여 경로: 마이페이지 > 포인트 > 친구 초대 미션)"
                            }
                        })
                        .catch(function (data) {
                            const error = data.response.data.error
                            vue.recommendMemberIdValidMessage = error.message
                            vue.recommendMemberIdValid = false
                        });
                }, 300),
                privacyAgree: function (value) { vue.checkAllTermsTrue() },
                useTermsAgree: function (value) { vue.checkAllTermsTrue() },
                over14Agree: function (value) { vue.checkAllTermsTrue() },
                marketingReceiveAgree: function (value) { vue.checkAllTermsTrue() },
            },
            computed: {
                emailDomainAutoCompleteList: function () {
                    if (this.email === '') {
                        return []
                    }
                    const atPosition = this.email.indexOf("@")
                    if (atPosition < 0) {
                        return []
                    }
                    const prefix = this.email.slice(0, atPosition + 1)
                    const inputDomain = this.email.slice(atPosition + 1, this.email.length)
                    const filtered = this.emailDomainList.filter(domain => domain.startsWith(inputDomain) && domain !== inputDomain)
                    return filtered.map(domain => ({ "beforeAt": prefix, "domain": domain }))
                },
                readyToJoin: function () {
                    if (!this.memberIdValid || !this.emailValid || !this.passwordValid || !this.passwordConfirmValid) {
                        return false
                    }

                    if (!this.kakaoJoin) {
                        if (!this.privacyAgree || !this.useTermsAgree || !this.over14Agree) {
                            return false
                        }
                    }

                    return this.getRecommendMemberIdValid();
                },
                linkForNonMember: function () {
                    return '/auth/login?referer=' + encodeURIComponent("https://www.musinsa.com/app/order/order_form")
                },
            },
            filters: {},
        })
    })()

</script>
</html>