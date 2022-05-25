<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/yewon.css">
<div class="body-margin body-padding">
	<div id="subTitle">
		<h1 class="orange">학습</h1><h1>공간</h1>
		<p>마음에 드는 게임을 골라보아요!</p>
	</div>
	<hr>
	
	<!-- preview -->
	<div id="gList">
		<ul>
			<li id="preview">
				<a href="">
					<img id="gThumbnail" width="400px" src="resources/imgs/webhajo_logo.png">
					<div>
						<h2>게임 이름</h2>
						<div>게임 내용</div>
					</div>
				</a>
			</li>
			<li id="preview">
				<a href="">
					<img id="gThumbnail" width="400px" src="resources/imgs/webhajo_logo.png">
					<div>
						<h2>게임 이름</h2>
						<div>게임 내용</div>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div style="clear: both;"></div> <!-- li's float left clear -->
</div>
<%@ include file="footer.jsp" %>