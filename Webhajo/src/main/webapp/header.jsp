<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Social junior</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>

<%
	String nickname = null;
	
	nickname = (String)session.getAttribute("nickname");

%>

<body>
	<div id="wrap">
		<header>
			<nav>
				<a href = "index.jsp">
					<img src="resources/imgs/webhajo_logo.png" alt="소셜주녀 로고" width="150px">
				</a>
			
				<div id = menue>
					<a href = "intro.jsp">소개</a>
					<a href = "board.jsp">공지사항</a>
					<a href = "study_space.jsp">학습공간</a>
					<a href = "" onclick="mypage()">마이페이지 </a>	
				</div>
				 
				<%
					if(nickname == null){
						
					
				%>				 

				<div id="login">
					<a href = "login.jsp">로그인</a>
					<a href = "register.jsp">회원가입</a>
				</div>
				<%
					}
					else{
				%>
				<div id="login">
					<a href = ""><%=nickname%></a>
					<a href = "logout.jsp">로그아웃</a>
				</div>
				<%
					}
				%>					

			</nav>
		</header>
		<script>
			function logout(){
				console.log("test");
			}
			function mypage(){
				event.preventDefault();
				<%
				String type = (String)session.getAttribute("type");
				if(nickname  == null){
				%>
					alert("로그인을 후 이용해주세요.");
				<%
				}
				else if(type.equals("student")){
					%>
					location.href = "mypage.jsp";
				<%
				} else{
					
				%>
					location.href = "teacher.jsp";
				<%
				}
				%>
				
			}
		</script>
