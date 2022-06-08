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
		<div class="border-yellow">
			<h2 id="game_title">게임 내용</h2>
			<textarea class="game_descript" id="game_descript" name="game_descript" disabled onkeydown="resize(this)" onkeyup="resize(this)"></textarea>		
		</div>
		<div class="border-yellow">
			<h2 id="game_title">플레이 방법</h2>
			<textarea id="game_descript" name="how_to_play" disabled onkeydown="resize(this)" onkeyup="resize(this)">1. 게임 화면의 어느곳이든 클릭하여 다음 장면으로 넘어갈 수 있습니다.</textarea>
			<textarea id="game_descript" name="how_to_play" disabled onkeydown="resize(this)" onkeyup="resize(this)">2. 선택지가 나타나면 선택을 해보세요!</textarea>
			<textarea id="game_descript" name="how_to_play" disabled onkeydown="resize(this)" onkeyup="resize(this)">3. 끝까지 진행하여 여러분의 선택으로 만들어진 엔딩을 확인해보세요!</textarea>
		</div>
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
			"text": "한 번 더 클릭하여 시작합니다."
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
			"char1": './resources/game_imgs/grasshopper_default.png',
			"char2": './resources/game_imgs/ant_default.png',
			"text": "지나가다 그 모습을 본 개미는"
		},
		{
			"char1": './resources/game_imgs/grasshopper_default.png',
			"char2": './resources/game_imgs/ant_default.png',
			"text": "베짱이에게 말을 걸어보았습니다."
		},
		{
			"char1": './resources/game_imgs/grasshopper_default.png',
			"char2": './resources/game_imgs/ant_talking.png',
			"name": "개미",
			"text": "안녕! 나는 개미라고 해~"
		},
		{
			"char1": './resources/game_imgs/grasshopper_default.png',
			"char2": './resources/game_imgs/ant_talking.png',
			"name": "개미",
			"text": "넌 이름이 뭐니?"
		},
		{
			"char1": './resources/game_imgs/grasshopper_talking.png',
			"char2": './resources/game_imgs/ant_default.png',
			"name": "베짱이",
			"text": "나는.."
		},
		{
			"char1": './resources/game_imgs/grasshopper_talking.png',
			"char2": './resources/game_imgs/ant_default.png',
			"select": [
			{
				"char1": './resources/game_imgs/grasshopper_talking.png',
				"char2": './resources/game_imgs/ant_default.png',
				"text": "네가 알아서 뭐하게?",
			}, {
				"char1": './resources/game_imgs/grasshopper_talking.png',
				"char2": './resources/game_imgs/ant_default.png',
				"text": "베짱이라고 해~ 넌 뭘 하고 있는 거니?",
			}
			]
		},
		{
			"char1": './resources/game_imgs/grasshopper_talking.png',
			"char2": './resources/game_imgs/ant_default.png',
			"name": "베짱이",
			"text": "근데 넌 뭘 그렇게 열심히 하니?"
		},
		{
			"char1": './resources/game_imgs/grasshopper_default.png',
			"char2": './resources/game_imgs/ant_talking.png',
			"name": "개미",
			"text": "나는 겨울을 날 식량을 모으고 있어!"
		},
		{
			"char1": './resources/game_imgs/grasshopper_default.png',
			"char2": './resources/game_imgs/ant_talking.png',
			"name": "개미",
			"text": "지금 열심히 모아놔야 겨울을 굶지 않고 보낼 수 있어!"
		},
		{
			"char1": './resources/game_imgs/grasshopper_talking.png',
			"char2": './resources/game_imgs/ant_default.png',
			"select": [
			{
				"text": "너 참 성실하구나!",
				"jump": "2-a"
			}, {
				"text": "그때부터 일 시작하면 안돼?",
				"jump": "2-b"
			}
			]
		}
		],
		"2-a": [
			{
				"text": "temp",
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "하핫 고마워!"
			},
			{
				"jump": "scene3"
			},
		],
		"2-b": [
			{
				"text": "temp",
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "겨울은 추워서 식량을 구하기 어렵단 말이야!"
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "지금 식량을 모아두지 않으면 굶어 죽게 돼!"
			},
			{
				"jump": "scene3"
			},
		],
		"scene3": [
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "너도 같이 일 하지 않을래?"
			},
			{
				"char1": './resources/game_imgs/grasshopper_talking.png',
				"char2": './resources/game_imgs/ant_default.png',
				"name": "베짱이",
				"text": "나는.."
			},
			{
				"char1": './resources/game_imgs/grasshopper_talking.png',
				"char2": './resources/game_imgs/ant_default.png',
				"select": [
				{
					"text": "싫어. 혼자 해. 나는 노래가 좋아.",
					"jump": "3-a"
				}, {
					"text": "권유는 고맙지만, 지금은 딱히 일을 하고 싶지 않아.",
					"jump": "3-b"
				}, {
					"text": "좋아!",
					"jump": "happyEnd"
				}
				]
			}
		],
		"3-a": [
			{
				"text": "temp"
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "그래, 그럼 난 먼저 가볼게."
			},
			{
				"jump": "badEnd"
			}
		],
		"3-b": [
			{
				"text": "temp"
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "그래? 그럼 나중에라도 일 할 생각이 들면, 같이 일 하자!"
			},
			{
				"jump": "scene4"
			}
		],
		"scene4": [
			{
				"bg": "./resources/game_imgs/background_winter.png",
				"text": "몇 달 뒤 . ."
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "베짱아! 왜 일 하러 오지 않았니? 식량은 잘 챙겨놨어?"
			},
			{
				"char1": './resources/game_imgs/grasshopper_talking.png',
				"char2": './resources/game_imgs/ant_default.png',
				"select": [
				{
					"text": "미안해.. 바로 네 말 들을걸, 깜빡해 버렸어..\n혹시 식량을 나눠줄 수 있겠니?",
					"jump": "4-a"
				}, {
					"text": "네가 뭔 상관이야! 신경 꺼!",
					"jump": "4-b"
				}, {
					"text": "그럼~ 네 말 듣고 바로 일 하러 가서, 챙겨놨어!",
					"jump": "happyEnd"
				}
				]
			}
		],
		"4-a": [
			{
				"text": "temp",
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "이번 한 번 만이야? 다음엔 꼭 같이 일 하자~"
			},
			{
				"char1": './resources/game_imgs/grasshopper_talking.png',
				"char2": './resources/game_imgs/ant_default.png',
				"select": [
				{
					"text": "알았어! (일? 내가 왜 하냐? 나중에 또 개미한테 부탁해야지~)",
					"jump": "badEnd"
				}, {
					"text": "알았어! (이거 먹고, 개미를 도와 일 해야겠다.)",
					"jump": "happyEnd"
				}
				]
			}
		],
		"4-b": [
			{
				"text": "temp",
			},
			{
				"name": "개미",
				"char1": './resources/game_imgs/grasshopper_default.png',
				"char2": './resources/game_imgs/ant_talking.png',
				"text": "그래? 그럼 난 가볼게."
			},
			{
				"jump": "badEnd"
			}
		],
		"badEnd": [
			{
				"bg": "./resources/game_imgs/bad_end.png"
			},
			{
				"text": "일을 하지 않아 식량을 모아둘 수 없었던 베짱이는"
			},
			{
				"text": "이번 겨울을 무사히 보낼 수 없었습니다."
			},
			{
				"text": "Bad End . .",
			},
			{
				"text": "한 번 더 클릭하여 시작으로 돌아가기",
			},
			{
				"jump": "start"
			}
		],
		"happyEnd": [
			{
				"text": "temp"
			},
			{
				"bg": "./resources/game_imgs/happy_end.png"
			},
			{
				"text": "개미와 베짱이는 아껴둔 식량으로"
			},
			{
				"text": "행복하게 겨울을 날 수 있었습니다."
			},
			{
				"text": "Happy End",
			},
			{
				"text": "한 번 더 클릭하여 시작으로 돌아가기",
			},
			{
				"jump": "start"
			}
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
	
	var gdescript = document.getElementById("game_descript");
	gdescript.value = "  무더운 여름, 개미는 땀을 뻘벌 흘리며 일을 하고 있어요. 베짱이는 나무 그늘에서 노래를 부르며 놀고 있었죠. 개미는 베짱이에게 어떤 말을 해줄 수 있을까요? 베짱이는 개미를 어떻게 대해야 할까요? 이야기 속으로 빠져봅시다.";
</script>
<%@ include file="footer.jsp" %>