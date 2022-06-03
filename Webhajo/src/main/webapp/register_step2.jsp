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
			<div class="title">회원정보 입력</div>
			<p style="text-align: center;">회원 정보를 입력해주세요.</p>
			<div style="display: flex; justify-content: center;">
				<img alt="num1" src="resources/imgs/number_one.png" style="width: 50px; padding-right: 20px;">
				<img alt="num2" src="resources/imgs/number_2.png" style="width: 50px; padding-right: 20px;">
				<img alt="num3" src="resources/imgs/number3.png" style="width: 50px">
			</div>
			
			
			<form name="register_form" onsubmit="register_btn()" method="get">
			<div style="position: relative; left: 25%; width: 50%;">
			<div style="margin-top: 15px; display: flex; flex-direction: row; padding-top: 10px;">
				<div style="display: flex; flex-direction: column; ">
					<div class="type"><strong>회원 유형</strong></div>
					<div style="display: flex;">
						<div><input type="radio" value="student" id="student" name="user"/>학생</div>
						<div style="margin-left: 25px;"><input type="radio" value="teacher" id="teacher" name="user"/>선생님</div>
					</div>
				</div>
				<div style="width: 30%;"></div>
				<div style="display: flex; flex-direction: column; ">
					<div class="type"><strong>성별</strong></div>
					<div>
						<select name="gender" id="genders" style="padding:2% 1% 2% 1%;">
						  <option value="gender">성별</option>
						  <option value="male">남성</option>
						  <option value="female">여성</option>
						</select>
					</div>
				</div>
			</div>

			<div>
				<div class="type"><strong>닉네임</strong></div>
				<div><input type="text" id="nickname" style="width:100%"/></div>
			</div>
			
			<div>
				<div class="type"><strong>이름</strong></div>
				<div><input type="text" id="userName" style="width:100%"/></div>
			</div>
			
			<div>
				<div class="type"><strong>학년</strong></div>
				<div>
					<select name="grade" id="grades" style="padding:2% 1% 2% 1%;">
						<option value="">선택해주세요</option>
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
						<option value="5">5학년</option>	
						<option value="6">6학년</option>						
					</select>
				</div>
			</div>

			<div>
				<div class="type"><strong>이메일</strong></div>
				<div><input type="text" id="userEmail" style="width: 100%"/></div>
			</div>
			<div style="display:flex; justify-content: center;">
				<button class="buttonZip" onclick="location.href='register.jsp'">취소</button>
				<button class="buttonZip" type="submit">다음</button>
			</div>
			
			</div>
			
			</form>
		</div>
		
	</div>
</body>
<script>
	function register_btn(){
	
		var isFull = true;
		
		//회원 유형 
		var student = document.getElementsByName("user")[0];
		var teacher = document.getElementsByName("user")[1];
		
		var user = null;
		
		if(student.checked || teacher.checked){
			if(student.checked){
				user = student.value;
			}
			else{
				user = teacher.value;
			}
		}
		else{
			isFull = false;
		}

		
		
		//성별
		var genders = document.getElementById("genders");
		var gender = null;
		
		if(genders.value == "gender"){
			isFull = false;
		}
		else if (genders.value == "female"){
			gender = 'W';
		}
		else{
			gender = 'M';
		}
		
		//닉네임
		var nickname = document.getElementById("nickname").value;
		
		if(nickname == ''){
			isFull = false;
		}
		
		
		var userName = document.getElementById("userName").value;
		
		if(userName == ''){
			isFull = false;
		}
		
		var grade =  document.getElementById("grades").value;

		if(grades == ""){
			isFull = false;
		}

		
		var userEmail = document.getElementById("userEmail").value;
		
		if(userEmail == ""){
			isFull = false;
		}

		
		if(isFull){
			document.register_form.submit("register_step3.jsp");
		}
		else{
			alert("빈칸을 모두 채워주세요.");
		}
		
	
	}
</script>
</html>