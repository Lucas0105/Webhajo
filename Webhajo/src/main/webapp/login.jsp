<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="resources/css/login.css">

<div class="login">
	<div class="container">
	<div class="title">아이디/비밀번호</div>
		<div style="position: relative; left: 25%; width: 50%;">
		<form name="loginform" action="login_process.jsp" method="post">
				<div>
					<div class="type"><strong>아이디</strong></div>
					<div><input id="userId" name="userId" type="text" style="width: 100%; padding: 10px;" placeholder="4~20자의 영문숫자를 입력해주세요"/></div>
				</div>			
				<div>
					<div class="type"><strong>비밀번호</strong></div>
					<div><input id="password" name="password" type="password" style="width: 100%; padding: 10px;" placeholder="5자 이상의 영문/숫자를 조합해주세요"/></div>
				</div>					
				<div style="display: flex; margin-top: 20px;">
						<div><input type="checkbox"/>아이디 저장</div>
						<div style="margin-left: 25px;"><input type="checkbox"/>자동 로그인</div>
				</div>
				
				<div style="display:flex; justify-content: center;">
					<button class="buttonZip" onclick="location.href=''">취소</button>
			 		<button type="submit" class="buttonZip">완료</button>
				</div>	 	
			</form>	
				
			</div>
		
		</div>
</div>

<%@ include file="footer.jsp" %>