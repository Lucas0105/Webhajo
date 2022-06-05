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
				<a href="game_page.jsp">
					<img id="gThumbnail" width="400px" src="resources/game_imgs/ant_grass_thumbnail.png">
					<div id="gDescript">
						<h2>개미와 베짱이</h2>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div style="clear: both;"></div> <!-- li's float left clear -->
</div>
<%@ include file="footer.jsp" %>