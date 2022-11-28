
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
                


                <div v-if="!kakaoJoin" class="login-join-membership__form__agreement" v-cloak></div>
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
    </section>
    
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
                // email: "",
                // emailValid: null,
                // emailValidMessage: "",
                // password: "",
                // passwordValid: null,
                // passwordValidMessage: "",
                // passwordConfirm: "",
                // passwordConfirmValid: null,
                // passwordConfirmValidMessage: "",
                // recommendMemberId: "",
                // recommendMemberIdValid: null,
                // recommendMemberIdValidMessage: "",
                // showPassword: false,
                // showPasswordConfirm: false,
                // agreeAll: false,
                // privacyAgree: false,
                // useTermsAgree: false,
                // over14Agree: false,
                // marketingReceiveAgree: false,
                // joinButtonClicked: false,
                // app: false,
                // joinType: "",
                // kakaoJoin: false,
                // passwordCheckPass: false,
                // hyundaiCardJoin: false,
                // emailDomainList: ["naver.com", "gmail.com", "hanmail.net", "nate.com", "daum.net"],
                // friendInviteEventChannel: ""
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