<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/yewon.css">
<div class="body-margin body-padding">
	<div>
		<h1 align="center">학습공간</h1>
		<hr>
	</div>
	<div class="body-margin body-padding">
		<h2>게임 제목</h2>
		<canvas id="gSpace" width="800" height="600"></canvas>
		<div>게임 설명설명</div>
	</div>

</div>
<script>
	var c = document.getElementById("gSpace");
	var ctx = c.getContext("2d");
	ctx.moveTo(0, 0);
	ctx.lineTo(800, 600);
	ctx.moveTo(800, 0);
	ctx.lineTo(0, 600);
	ctx.stroke();
</script>
<%@ include file="footer.jsp" %>