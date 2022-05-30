<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/register.css">
<link rel="stylesheet" href="css/bootstrap.css">
<body>
	<div class="register">
		<div class="container">
			<img alt="garland" src="resources/imgs/garland.png" style="width:100%; margin-bottom:2%;">
			<div class="title">ȸ������ �Է�</div>
			<p style="text-align: center;">ȸ�� ������ �Է����ּ���.</p>
			<div style="display: flex; justify-content: center;">
				<img alt="num1" src="resources/imgs/number_one.png" style="width: 50px; padding-right: 20px;">
				<img alt="num2" src="resources/imgs/number_2.png" style="width: 50px; padding-right: 20px;">
				<img alt="num3" src="resources/imgs/number3.png" style="width: 50px">
			</div>
			
			<div style="position: relative; left: 25%; width: 50%;">
			<div style="margin-top: 15px; display: flex; flex-direction: row; padding-top: 10px;">
				<div style="display: flex; flex-direction: column; ">
					<div class="type"><strong>ȸ�� ����</strong></div>
					<div style="display: flex;">
						<div><input type="checkbox"/>�Ϲ�</div>
						<div style="margin-left: 25px;"><input type="checkbox"/>������</div>
					</div>
				</div>
				<div style="width: 30%;"></div>
				<div style="display: flex; flex-direction: column; ">
					<div class="type"><strong>����</strong></div>
					<div>
						<select name="gender" id="genders" style="padding:2% 1% 2% 1%;">
						  <option value="gender">����</option>
						  <option value="male">����</option>
						  <option value="female">����</option>
						</select>
					</div>
				</div>
			</div>
			
			<div>
				<div class="type"><strong>�г���</strong></div>
				<div><input type="text" style="width:100%"/></div>
			</div>
			
			<div>
				<div class="type"><strong>��ǰ ���� �г�</strong></div>
				<div>
					<select name="grade" id="grades" style="padding:2% 1% 2% 1%;">
						<option value="grade">�������ּ���</option>
						<option value="grade1">1�г�</option>
						<option value="grade2">2�г�</option>
						<option value="grade3">3�г�</option>
						<option value="grade4">4�г�</option>
						<option value="grade5">5�г�</option>	
						<option value="grade6">6�г�</option>						
					</select>
				</div>
			</div>

			<div>
				<div class="type"><strong>�̸���</strong></div>
				<div><input type="text" style="width: 100%"/></div>
			</div>
			<div style="display:flex; justify-content: center;">
				<button class="buttonZip" onclick="location.href='register.jsp'">���</button>
				<button class="buttonZip" onclick="location.href='register_step3.jsp'">����</button>
			</div>
			
			</div>
		</div>
	</div>
</body>
</html>