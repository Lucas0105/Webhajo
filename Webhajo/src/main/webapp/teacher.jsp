<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://d3js.org/d3.v7.min.js"></script>
<link rel="stylesheet" href="resources/css/teacher.css">

<div id="teacher">
	<div class="left-frame">
		<p>
			Webhajo
		</p>
		<p>청주초등학교</p>
		<p>Cheongju<br/> Elementary<br/> School</p>
		
		<br/><br/><br/><br/>
		<p class="grade">
			담당학급
		</p>
		
		<a href="#">
			1학년
		</a>
		
		<a class="select" href="#">
			2학년
		</a>
		
		<a href="#">
			3학년
		</a>
		
		<a href="#">
			4학년
		</a>
		
		<a href="#">
			5학년
		</a>
		
		<a href="#">
			6학년
		</a>
	</div>
	
	
	<div class="mid-frame">
		<p>대시보드</p>
		<div class="study-rate">
			<h3>학습률</h3>
			
			<svg width="800" height="300"></svg>
		</div>
		
		<div class="attend-rate">
		</div>
		
		<div class="student-manage">
		</div>
		
		
		<div class="student-list">
			<h3>학생명단</h3>
			<table>
				<tr>

					<th>
						출석번호
					</th>
					
					<th>
						학생이름
					</th>
					
					<th>
						최근 학습한 게임
					</th>
					
					<th>
						게임 점수
					</th>
					
					<th>
						피드백
					</th>
					
					<th>
						출석여부
					</th>

				</tr>
				<tr>
					<td>
						1
					</td>
					<td>
						홍길동
					</td>
					<td>
						개미와 배짱이
					</td>
					<td>
						3
					</td>
					<td>
						버튼
					</td>
					<td>
						초록 or 빨강색
					</td>
				</tr>
				<tr>
					<td>
						2
					</td>
					<td>
						홍길동
					</td>
					<td>
						개미와 배짱이
					</td>
					<td>
						3
					</td>
					<td>
						버튼
					</td>
					<td>
						초록 or 빨강색
					</td>
				</tr>
				<tr>
					<td>
						3
					</td>
					<td>
						홍길동
					</td>
					<td>
						개미와 배짱이
					</td>
					<td>
						3
					</td>
					<td>
						버튼
					</td>
					<td>
						초록 or 빨강색
					</td>
				</tr>
				<tr>
					<td>
						4
					</td>
					<td>
						홍길동
					</td>
					<td>
						개미와 배짱이
					</td>
					<td>
						3
					</td>
					<td>
						버튼
					</td>
					<td>
						초록 or 빨강색
					</td>
				</tr>
				<tr>
					<td>
						5
					</td>
					<td>
						홍길동
					</td>
					<td>
						개미와 배짱이
					</td>
					<td>
						3
					</td>
					<td>
						버튼
					</td>
					<td>
						초록 or 빨강색
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="right-frame">
		<div class="attend">
			<h3>
				출석률
			</h3>
			<p><b>학생 수 30명</b></p>
			<p>출석 인원 29명</p>
			<p>결석 인원 1명 </p>
			<p>오늘의 학습률 80%</p>
			<progress id="mileageBar" class="mileageBar" value="80" min="0" max="100"></progress>
				
		</div>
		
		<div class="attend-record">
			<h3>
				접속기록
			</h3>
			<table>
				<tr>
					<th>
						출석시간
					</th>
					<th>
						출석번호
					</th>
					<th>
						학생이름
					</th>
				</tr>
				<tr>
					<td>
						2022/05/26 06:12:25
					</td>
					<td>
						1
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022/05/26 06:12:25
					</td>
					<td>
						2
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022/05/26 06:12:25
					</td>
					<td>
						3
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022/05/26 06:12:25
					</td>
					<td>
						4
					</td>
					<td>
						홍길동
					</td>
				</tr>
				<tr>
					<td>
						2022/05/26 06:12:25
					</td>
					<td>
						5
					</td>
					<td>
						홍길동
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script>
// grid: x/y axis, tooltip
var dataset = [{x:'1', y:9 }, {x:'2', y:19}, {x:'3', y:29}, {x:'4', y:39}, 
               {x:'5', y:29}, {x:'6', y:19}, {x:'7', y:9 }, {x:'8', y:9 }, {x:'9', y:9 },
               {x:'10', y:9 },{x:'11', y:9 }, {x:'12', y:19}, {x:'13', y:29}, {x:'14', y:39}, 
               {x:'15', y:29}, {x:'16', y:19}, {x:'17', y:9 }, {x:'18', y:9 }, {x:'19', y:9 },
               {x:'20', y:9 },{x:'21', y:9 }, {x:'22', y:19}, {x:'23', y:29}, {x:'24', y:59}, 
               {x:'25', y:29}, {x:'26', y:19}, {x:'27', y:9 }, {x:'28', y:9 }, {x:'29', y:9 }, {x:'30', y:9 }, {x:'31', y:9 }];

var svg = d3.select("svg");
var width  = parseInt(svg.style("width"), 10) -30;
var height = parseInt(svg.style("height"), 10)-20;

var svgG = svg.append("g")
    .attr("transform", "translate(30, 0)");
          
var xScale = d3.scaleBand()
    .domain(dataset.map(function(d) { return d.x;} ))
    .range([0, width]).padding(0.2);

var yScale = d3.scaleLinear()
    .domain([0, d3.max(dataset, function(d){ return d.y; })])
    .range([height, 0]);
    
svgG.append("g")            
    .attr("class", "grid")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(xScale)
        .tickSize(-height)
    );
    
svgG.append("g")
    .attr("class", "grid")
    .call(d3.axisLeft(yScale)
        .ticks(5)
        .tickSize(-width)
    );
    
var barG = svgG.append("g");
    
barG.selectAll("rect")
    .data(dataset)
    .enter().append("rect")
        .attr("class", "bar")
        .attr("height", function(d, i) {return height-yScale(d.y)})
        .attr("width", xScale.bandwidth())
        .attr("x", function(d, i) {return xScale(d.x)})
        .attr("y", function(d, i) {return yScale(d.y)})
        .on("mouseover", function() { tooltip.style("display", null); })
        .on("mouseout",  function() { tooltip.style("display", "none"); })
        .on("mousemove", function(d) {
            var xP = d3.mouse(this)[0];
            var yP = d3.mouse(this)[1] - 25;
            tooltip.attr("transform", "translate(" + xP + "," + yP + ")");
            tooltip.select("text").text(d.y);
        });        
    
barG.selectAll("text")
    .data(dataset)
    .enter().append("text")
    .text(function(d) {return d.y})
        .attr("class", "text")
        .attr("x", function(d, i) {return xScale(d.x)+xScale.bandwidth()/2})
        .style("text-anchor", "middle")
        .attr("y", function(d, i) {return yScale(d.y) + 15});

var tooltip = svg.append("g")
    .attr("class", "tooltip")
    .style("display", "none");
    
tooltip.append("rect")
    .attr("width", 30)
    .attr("height", 20)
    .attr("fill", "white");

tooltip.append("text")
    .attr("x", 15)
    .attr("dy", "1em")
    .style("text-anchor", "middle");
    
</script>
<%@ include file="footer.jsp" %>

