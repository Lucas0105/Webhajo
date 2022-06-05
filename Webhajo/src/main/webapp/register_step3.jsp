<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String user = request.getParameter("user");
	String gender = request.getParameter("gender");
	String nickname = request.getParameter("nickname");
	String userName = request.getParameter("userName");
	String grade = request.getParameter("grade");
	String userEmail= request.getParameter("userEmail");
%>
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
				<form name="register_form" action="register_process.jsp" method="post">
				<div>
					<div class="type"><strong>아이디</strong></div>
					<div><input type="text" name="userId" id="userId" style="width:  100%; padding: 10px;" placeholder="4~20자의 영문숫자를 입력해주세요"/></div>
				</div>			
				<div>
					<div class="type"><strong>비밀번호</strong></div>
					<div><input type="password" name="userPw" id="userPw1"  style="width: 100%; padding: 10px;" placeholder="5자 이상의 영문/숫자를 조합해주세요"/></div>
				</div>			
				<div>
					<div class="type"><strong>비밀번호 확인</strong></div>
					<div><input type="password" id="userPw2" style="width: 100%; padding: 10px;" placeholder="비밀번호를 한번 더 입력해주세요"/></div>
				</div>			
				<div style="display:flex; justify-content: center;">
					<button class="buttonZip" type="reset" onclick="location.href='register_step3.jsp'">취소</button>
					<button class="buttonZip" onclick="register_btn()">완료</button>
				</div>
				<input type="hidden" name="user" value="<%=user %>" />
				<input type="hidden" name="gender" value="<%=gender %>" />
				<input type="hidden" name="nickname" value="<%=nickname %>" />
				<input type="hidden" name="userName" value="<%=userName %>" />
				<input type="hidden" name="grade" value="<%=grade %>" />
				<input type="hidden" name="userEmail" value="<%=userEmail %>" />			
				</form>
			</div>
			
			
		
		</div>
	</div>
</body>
<script>
	function register_btn(){
		event.preventDefault();

		var userId = document.getElementById("userId").value;
		var userPw1 = document.getElementById("userPw1").value;
		var userPw2 = document.getElementById("userPw2").value;
		
		var isFull = true;
		
		if(userId == "" || userPw1 == "" || userPw2 == ""){
			alert("빈칸을 모두 채워주세요.");
		}
		else{
			if(userPw1 != userPw2){
				alert("비밀번호가 서로 다릅니다. 다시 입력해주세요.");	
			}
			else{
				document.register_form.submit();
			}
			
		}
		
	}
	
</script>
</html>