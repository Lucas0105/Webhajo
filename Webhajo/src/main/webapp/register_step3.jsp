<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/register.css">
<body>
	<div class="register">
		<div class="container">
			<img alt="garland" src="resources/imgs/garland.png" style="width:100%; margin-bottom:2%;">
			<div class="title">���̵�/��й�ȣ</div>
			<p style="text-align: center;">�Ҽ��ֳ࿡�� ����� ���̵�� ��й�ȣ�� �Է����ּ���.</p>
			<div style="display: flex; justify-content: center;">
				<img alt="num1" src="resources/imgs/number_one.png" style="width: 50px; padding-right: 20px;">
				<img alt="num2" src="resources/imgs/number_2.png" style="width: 50px; padding-right: 20px;">
				<img alt="num3" src="resources/imgs/number_3.png" style="width: 50px">
			</div>
			
			<div style="position: relative; left: 25%; width: 50%;">
				<div>
					<div class="type"><strong>���̵�</strong></div>
					<div><input type="text" style="width: 100%; padding: 10px;" placeholder="4~20���� �������ڸ� �Է����ּ���"/></div>
				</div>			
				<div>
					<div class="type"><strong>��й�ȣ</strong></div>
					<div><input type="password" style="width: 100%; padding: 10px;" placeholder="5�� �̻��� ����/���ڸ� �������ּ���"/></div>
				</div>			
				<div>
					<div class="type"><strong>��й�ȣ Ȯ��</strong></div>
					<div><input type="password" style="width: 100%; padding: 10px;" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���"/></div>
				</div>			
				<div style="display:flex; justify-content: center;">
					<button class="buttonZip" onclick="location.href='register_step2.jsp'">���</button>
					<button class="buttonZip" onclick="location.href='register_step3.jsp'">�Ϸ�</button>
				</div>	
				
			</div>
			
			
		
		</div>
	</div>
</body>
</html>