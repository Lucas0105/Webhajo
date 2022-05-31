<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/register.css">
<body>
	<div class="register">
		<div class="container">
			<img alt="garland" src="resources/imgs/garland.png" style="width:100%; margin-bottom:2%;">
			<div class="title">아이디/비밀번호</div>
			<p style="text-align: center;">소셜주녀에서 사용할 아이디와 비밀번호를 입력해주세요.</p>
			<div style="display: flex; justify-content: center;">
				<img alt="num1" src="resources/imgs/number_one.png" style="width: 50px; padding-right: 20px;">
				<img alt="num2" src="resources/imgs/number_2.png" style="width: 50px; padding-right: 20px;">
				<img alt="num3" src="resources/imgs/number_3.png" style="width: 50px">
			</div>
			
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
				<div style="display:flex; justify-content: center;">
					<button class="buttonZip" onclick="location.href='register_step2.jsp'">취소</button>
					<button class="buttonZip" onclick="location.href='register_step3.jsp'">완료</button>
				</div>	
				
			</div>
			
			
		
		</div>
	</div>
</body>
</html>