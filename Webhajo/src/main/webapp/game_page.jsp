<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/game.css">
<div class="body-margin body-padding">
	<div id="subTitle">
		<h1 class="orange">학습</h1><h1>공간</h1>
	</div>
	<hr>
	
	<div class="game-body">
		<h2 id="game_title">개미와 베짱이</h2>
			<div align="center">
				<div id="whole-wrapper" onclick="parse(++cursor)">
					<div id="character1-wrapper"></div>
					<div id="character2-wrapper"></div>
					
					<div id="chat-wrapper">
						<div id="name"></div>
						<div id="text-wrapper">
							<div id="text"></div>
						</div>
					</div>
					
					<div id="selector-wrapper">
					  <ul id="selector">
					  </ul>
					</div>
				</div>
			</div>
		<textarea id="game_descript" name="game_descript" disabled onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
	</div>

</div>

<!-- 게임 스크립트 -->
<script>
let cursor = 0;
let currentPhase = "start";

const scenario = {
		"start": [
		{
			"bg": "./resources/game_imgs/start.png",
			"text": "클릭하여 게임을 시작합니다."
		},
		{
			"bg": "./resources/game_imgs/background_spring.png",
			"text": "옛날 옛날에 개미와 베짱이가 살았어요."
		},
		{
			"char1": './resources/game_imgs/grasshopper_default.png',
			"text": "베짱이는 노는 것을 매우 좋아하는 친구랍니다.\n베짱이는 오늘도 아무 일도 하지 않았어요."
		},
		{
			"name": "김애저",
			"text": "두번쨰 샘플 텍스트입니다.",
		},
		{
			"text": "이름이 없는 경우에는 이름 창이 사라졌으면 좋겠어요."
		},
		{
			"name": "rladowj",
			"text": "왈왈",
			"char1": './resources/game_imgs/grasshopper_default.png',
			"bg": "./resources/game_imgs/background_winter.png"
		},
		{
			"select": [
			{
				"text": "선택지 1번",
				"jump": "select1"
			}, {
				"text": "선택지 2번",
			}
			]
		},
		{
			"name": "김애저",
			"text": "선택완료",
			"char2": './resources/game_imgs/ant_default.png'
		}
		],
		"select1": [
		{
			"text": "temp",
		},
		{
			"text": "선택지 1번을 클릭 했습니다.",
		},
		{
			"jump": "start"
		},
		]
	  }

const jumping = (jump) => {
	currentPhase = jump
	cursor = 0;
	parse(0);
}

const handleSelect = (v) => {
	const {text, jump} = JSON.parse(decodeURI(v))

	//jump가 있으면 점프, 없으면 시나리오를 이어서 출력
	if (!!jump) {
	  jumping(jump)
	} else {
	  parse(++cursor)
	}
  }

const parse = (i = 0) => {

	const {text, name, char1, char2, select, jump, bg} = scenario[currentPhase][i];


	//화면 초기화
	document.getElementById('name').style.display = 'none';
	document.getElementById('selector-wrapper').style.display = 'none';
	document.getElementById('chat-wrapper').style.display = 'none';
	document.getElementById('character1-wrapper').innerHTML = null;
	document.getElementById('character2-wrapper').innerHTML = null;
	
	//텍스트 유무에 따른 출력
	if (!!text) {
		document.getElementById('chat-wrapper').style.display = 'grid';
		document.getElementById('text').innerText = text;
	}


	//이름 유무에 따른 출력
	if (!!name) {
	  document.getElementById('name').style.display = 'grid';
	  document.getElementById('name').innerText = name;
	}

	//캐릭터 이미지 유무에 따른 출력
	if (!!char1) {
	  document.getElementById('character1-wrapper').innerHTML = `<img src="\${char1}"/>`
	}
	if (!!char2) {
	  document.getElementById('character2-wrapper').innerHTML = `<img src="\${char2}"/>`
	}
	
	//선택지가 있으면 선택지 출력
	if (!!select) {
	  document.getElementById('selector-wrapper').style.display = 'grid';
	  document.getElementById('selector').innerHTML = select.map(i =>
	  `<li onclick="handleSelect('\${encodeURI(JSON.stringify(i))}')">\${i.text}</li>`).join('')
	}
	
	//jump가 있으면 해당 시나리오 오브젝트로 이동
	if (!!jump) {
	  jumping(jump);
	}

	if (!!bg) {
      document.getElementById('whole-wrapper').style.backgroundImage = `url('\${bg}')`
    }
}
 
 parse(cursor);
</script>
	

<script>
	function resize(obj) {
		obj.style.height = '1px';
		obj.style.height = (12 + obj.scrollHeight) + 'px';
	}
	
	var txt = document.getElementById("game_descript");
	txt.value = "  무더운 여름, 개미는 땀을 뻘벌 흘리며 일을 하고 있어요. 베짱이는 나무 그늘에서 노래를 부르며 놀고 있었죠. 개미는 베짱이에게 어떤 말을 해줄 수 있을까요? 베짱이는 개미를 어떻게 대해야 할까요? 이야기 속으로 빠져봅시다.";
</script>
<%@ include file="footer.jsp" %>