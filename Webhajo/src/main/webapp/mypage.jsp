<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/mypage.css">
<div id="introduction">
	<div class= "long-square">
		
		<div class="circle-profile">
		
			<div class="profile">
				<h2>배고픈 라이언</h2>
				<p>어쩌구 저쩌고</p>
			</div>
		</div>
		

	</div>
	
	<div class="introBody">
		<h4>
			게임 마일리지 획득 이력
		</h4>
		<div class="mileage">
			<p class="max_score">max 점수</p>
			<p class="cur_score">현재 점수</p>
			<label for="mileageBar">게임 마일리지</label> &nbsp;&nbsp;
			<progress id="mileageBar" class="mileageBar" value="50" min="0" max="100"></progress>
			<div class="myMileage">
				나의 게임마일리지 10900
			</div>
			<div class="rank_frame">
				<img src="resources/imgs/rank.png" alt="랭킹 배경" width="150px">			
				<span>783위</span>
			</div>
			
		</div>
		<hr>
		
		<h4>
			기본정보
		</h4>
		
		<div class="basicInfo">
			<table>
				<tr>
					<td>
						학교
					</td>
					<td>
						충북초등학교
					</td>
					
					<td>
						담임 선생님
					</td>
					<td>
						홍길동
					</td>
				</tr>
				
				<tr>
					<td>
						학년
					</td>
					<td>
						4학년
					</td>
					
					<td>
						성별
					</td>
					<td>
						남성
					</td>
				</tr>
				
				
				<tr>
					<td>
						이름
					</td>
					<td>
						정원재
					</td>
					
					<td>
						주소
					</td>
					<td>
						충청북도 청주시 서원구 충대로 1
					</td>
				</tr>
				
				<tr>
					<td>
						연락처		
					</td>
					<td>
						01012345678
					</td>
					
					<td>
						이메일
					</td>
					<td>
						dj@gmail.com
					</td>
				</tr>
			</table>
			
		
		</div>
		<h4>
			피드백
		</h4>
		
		<div class="feedback">
			<table border='1'>
				<tr>
					<th>
						날짜
					</th>
					<th>
						게임
					</th>
					<th>
						피드백
					</th>
					<th>
						선생님
					</th>
				</tr>
				<tr>
					<td>
						2022.04.22
					</td>
					<td>
						게미와 배짱이
					</td>
					
					<td>
						아쉽군
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022.04.22
					</td>
					<td>
						게미와 배짱이
					</td>
					
					<td>
						아쉽군
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022.04.22
					</td>
					<td>
						게미와 배짱이
					</td>
					
					<td>
						아쉽군
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022.04.22
					</td>
					<td>
						게미와 배짱이
					</td>
					
					<td>
						아쉽군
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022.04.22
					</td>
					<td>
						게미와 배짱이
					</td>
					
					<td>
						아쉽군
					</td>
					<td>
						홍길동
					</td>
				</tr>
			</table>
		</div>
	</div>
	

	
	
</div>

<%@ include file="footer.jsp" %>