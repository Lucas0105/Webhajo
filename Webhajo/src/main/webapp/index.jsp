<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/yewon.css">
<div class="body-margin body-padding">
	<!-- 
	<div id="banner">
		<div>배너 실제로 넘어가는 부분</div>
		<div id="banList">
			<a><span class="active">0</span></a>
			<a><span class="blind">1</span></a>
			<a><span class="blind">2</span></a>
		</div>
	</div>
	-->
	<div id="bestGames">
		<div id="populBox">
			<div id="populTitle">
				<p>이 게임은 어때요?</p>
				<div class="elephant"></div>
				<h2 class="orange">인기</h2><h2>게임</h2>
				<div class="rabbit"></div>
			</div>
			<!-- preview -->
			<div id="gList">
				<ul>
					<li id="preview" style="margin: 60px 0 0 0">
						<span class="crown"></span>
						<a href="game_page.jsp">
							<img id="gThumbnail" width="400px" src="resources/game_imgs/ant_grass_thumbnail.png">
							<div id="gDescript">
								<h2>개미와 베짱이</h2>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div id="cute_tree"></div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>