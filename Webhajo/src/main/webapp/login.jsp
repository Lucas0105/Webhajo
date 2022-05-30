<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/login.css">

<div class="login">
	<div class="container">
	<div class="title">아이디/비밀번호</div>
		<div style="position: relative; left: 25%; width: 50%;">
				<div>
					<div class="type"><strong>아이디</strong></div>
					<div><input type="text" style="width: 100%; padding: 10px;" placeholder="4~20자의 영문숫자를 입력해주세요"/></div>
				</div>			
				<div>
					<div class="type"><strong>비밀번호</strong></div>
					<div><input type="password" style="width: 100%; padding: 10px;" placeholder="5자 이상의 영문/숫자를 조합해주세요"/></div>
				</div>			
				<div>
					<div class="type"><strong>비밀번호 확인</strong></div>
					<div><input type="password" style="width: 100%; padding: 10px;" placeholder="비밀번호를 한번 더 입력해주세요"/></div>
				</div>			
				<div style="display: flex; margin-top: 20px;">
						<div><input type="checkbox"/>아이디 저장</div>
						<div style="margin-left: 25px;"><input type="checkbox"/>자동 로그인</div>
				</div>
				
				<div style="display:flex; justify-content: center;">
					<button class="buttonZip" onclick="location.href=''">취소</button>
			 		<button class="buttonZip" onclick="location.href=''">완료</button>
				</div>	 	
				
			</div>
		</div>
</div>
<%@ include file="footer.jsp" %>