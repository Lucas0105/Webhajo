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
				<div><input type="text" style="width:100%"/></div>
			</div>
			
			<div>
				<div class="type"><strong>이름</strong></div>
				<div><input type="text" style="width:100%"/></div>
			</div>
			
			<div>
				<div class="type"><strong>학년</strong></div>
				<div>
					<select name="grade" id="grades" style="padding:2% 1% 2% 1%;">
						<option value="grade">선택해주세요</option>
						<option value="grade1">1학년</option>
						<option value="grade2">2학년</option>
						<option value="grade3">3학년</option>
						<option value="grade4">4학년</option>
						<option value="grade5">5학년</option>	
						<option value="grade6">6학년</option>						
					</select>
				</div>
			</div>

			<div>
				<div class="type"><strong>이메일</strong></div>
				<div><input type="text" style="width: 100%"/></div>
			</div>
			<div style="display:flex; justify-content: center;">
				<button class="buttonZip" onclick="location.href='register.jsp'">취소</button>
				<button class="buttonZip" onclick="location.href='register_step3.jsp'">다음</button>
			</div>
			
			</div>
		</div>
	</div>
</body>
</html>