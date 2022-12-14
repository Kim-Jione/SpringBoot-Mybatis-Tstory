<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div div class="my_auth_form_box">
            <div class="my_auth_form_box_title">메일주소 변경</div>
            <div class="my_auth_form_box_sub_title" >
                <div >계정의 이메일주소를 변경하려고 합니다.</div> <div>변경할 이메일 주소를 입력해주세요.</div>
            </div><br>

            <div>
                <input type="hidden" name="userId" value="${user.userId}" />

                <div style="display: flex">
                    <div class="my_auth_form_box_info_detail">변경전</div>
                    <input
                        id="email"
                        class="my_auth_form_box_input"
                        type="text"
                        value="${user.email}"
                        maxlength="50"
                        required
                        readonly
                    />
                </div>
                <div style="display: flex">
                    <div
                        class="my_auth_form_box_info_detail"
                        style="padding-right: 30px"
                    >
                        변경후
                    </div>
                    <input
                        oninput="checkEmail(); validEmail();"
                        id="emailUpdate"
                        class="my_auth_form_box_input"
                        type="text"
                        maxlength="50"
                        required
                    />
                </div>
                <span
                    class="emailValid"
                    style="padding-left: 90px; color: red; display: none"
                ></span>
                
            </div>


                <div style="text-align: right">
                        <button type="submit" class="btn btn-outline-primary" onclick="updateEmail();">
                            계속
                        </button>
                    </div>
            
            
        </div>
    </div>
</div>
</div>
<%@ include file="../layout/footer.jsp"%>
