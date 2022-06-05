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
		<h2 id="game_title">게임 제목</h2>
			<div align="center">
				<div id="whole-wrapper">
					<div id="character-wrapper"></div>
					
					<div id="chat-wrapper">
						<div id="name"></div>
						<div id="text-wrapper">
							<div id="text"></div>
							<div id="next" onclick="parse(++cursor)">
								<img src="resources/game_imgs/next.png">
							</div>
						</div>
						<div id="setting">
							<span>Log</span>
							<span>Skip</span>
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

const favor = {}

const scenario = {
		"start": [
		  {
			"name": "베짱이",
			"text": "첫번째 샘플 텍스트입니다.",
			"image": {
			  "src": 'resources/game_imgs/grasshopper_default.png',
			  "alt": '김애저'
			}
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
			"image": {
			  "src": 'resources/game_imgs/grasshopper_talking.png',
			  "alt": '김애저'
			}
		  },
		  {
			"select": [
			  {
				"text": "선택지 1번",
				"variable": [
				  {
					"name": "캐릭터1",
				  },
				  {
					"name": "캐릭터2",
				  }
				],
				"jump": "select1"
			  }, {
				"text": "선택지 2번",
				"variable": [
				  {
					"name": "캐릭터1",
				  },
				  {
					"name": "캐릭터2",
				  }
				]
			  }
			]
		  },
		  {
			"name": "김애저",
			"text": "선택완료",
			"image": {
			  "src": 'resources/game_imgs/grasshopper_talking.png',
			  "alt": '김애저'
			}
		  }
		],
		"select1": [
		  {
			"text": "선택지 1번을 클릭 했습니다",
		  },
		  {
			"text": "시작으로 돌아가기",
			"jump" : "start"
		  },
		]
	  }

const jumping = (jump) => {
	currentPhase = jump
	cursor = 0;
	parse(0);
}

const handleSelect = (v) => {
	const {variable, jump} = JSON.parse(v)
	
	//jump가 있으면 점프, 없으면 시나리오를 이어서 출력
	if (!!jump) {
	  jumping(jump)
	} else {
	  parse(++cursor)
	}
  }

const parse = (i = 0) => {

	const {text, name, image, select, jump} = scenario[currentPhase][i];


	//화면 초기화
	document.getElementById('name').style.display = 'none';
	document.getElementById('selector-wrapper').style.display = 'none';
	document.getElementById('character-wrapper').innerHTML = null;
	
	//텍스트 출력
	document.getElementById('text').innerText = text;


	//이름유무에 따른 출력
	if (!!name) {
	  document.getElementById('name').style.display = 'grid';
	  document.getElementById('name').innerText = name;
	}

	//이미지 유무에 따른 출력
	if (!!image) {
	  document.getElementById('character-wrapper').innerHTML = `<img src="${image.src}" alt="${image.alt}"/>`
	}
	
	//선택지가 있으면 선택지 출력
	if (!!select) {
	  document.getElementById('selector-wrapper').style.display = 'grid';
	  document.getElementById('selector').innerHTML = select.map(i =>
	  `<li onclick="handleSelect(${i})">${i.text}</li>`).join('')
	}
	
	//jump가 있으면 해당 시나리오 오브젝트로 이동
	if (!!jump) {
	  jumping(jump);
	}

	//커서가 시나리오의 끝에 오면 화살표 지움. 점프가 있으면 뒤가 이어지니 계속 출력
	if (scenario[currentPhase].length - 1 === cursor && !jump) {
	  document.getElementById('next').style.display = 'none';
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
	txt.value = "  속담은 예로부터 한 민족 혹은 사회에서 사람들 사이에서 널리 말하여져서 굳어진 어구로 전해지는 말이다. 격언이나 잠언과 유사하다. 속담은 그 속담이 통용되는 공동체의 의식 반영하기 때문에 언어학이나 문화인류학 등에서 연구 대상으로 많이 삼고 있다. 문학 작품에도 많이 등장한다. 위키백과";
</script>
<%@ include file="footer.jsp" %>