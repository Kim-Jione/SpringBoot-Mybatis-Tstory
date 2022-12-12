<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../layout/main-header.jsp"%>
<div class="container">
    <div class="my_auth_box">
        <div div class="my_auth_form_box">
            <div class="my_auth_form_box_title">메일주소 확인</div>
            <div class="my_auth_form_box_sub_title" >
                <div >계정의 메일주소를 변경하려고 합니다.</div> <div>계속하려면 메일로 발송된 확인 코드를 입력하세요.</div>
            </div><br>

            <form action="/s/api/user/updateForm">
                <div style="display: flex">
                    <div class="my_auth_form_box_info_detail_email">확인코드</div>
                <input
                    class="my_auth_form_box_input"
                    type="password"
                    name="password"
                    placeholder="확인코드를 입력해주세요."
                />
                <br>
                <input type="hidden" name="userId", value="${principal.userId}">
            
            </div>


                <div style="text-align: right">
                        <button type="submit" class="btn btn-outline-primary">
                            계속
                        </button>
                    </div>
            
                </form>
            
        </div>
    </div>
</div>
</div>
<%@ include file="../layout/footer.jsp"%>
