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
				<h2>인기 게임</h2>
				<div class="rabbit"></div>
			</div>
			<div id="cute_tree"></div>
			<!-- preview -->
			<div id="gList">
				<ul>
					<li id="preview">
						<span class="crown"></span>
						<a href="">
							<img id="gThumbnail" width="400px" src="resources/imgs/webhajo_logo.png">
							<div id="gDescript">
								<h2>게임 이름</h2>
								<div>게임 내용</div>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>