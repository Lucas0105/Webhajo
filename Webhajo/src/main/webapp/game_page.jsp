<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/yewon.css">
<div class="body-margin body-padding">
	<div id="subTitle">
		<h1 class="orange">학습</h1><h1>공간</h1>
	</div>
	<hr>
	
	<div>
		<h2 id="game_title">게임 제목</h2>
			<%@ include file="game.jsp" %>
		<textarea id="game_descript" name="game_descript" disabled onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
	</div>

</div>
<script>
	function resize(obj) {
		obj.style.height = '1px';
		obj.style.height = (12 + obj.scrollHeight) + 'px';
	}
	
	var txt = document.getElementById("game_descript");
	txt.value = "  속담은 예로부터 한 민족 혹은 사회에서 사람들 사이에서 널리 말하여져서 굳어진 어구로 전해지는 말이다. 격언이나 잠언과 유사하다. 속담은 그 속담이 통용되는 공동체의 의식 반영하기 때문에 언어학이나 문화인류학 등에서 연구 대상으로 많이 삼고 있다. 문학 작품에도 많이 등장한다. 위키백과";
</script>
<%@ include file="footer.jsp" %>