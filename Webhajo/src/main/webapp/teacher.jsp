<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>

<script src="https://d3js.org/d3.v7.min.js"></script>
<link rel="stylesheet" href="resources/css/teacher.css">
	<% 
		int aNum = Integer.parseInt((String)session.getAttribute("grade"))-1;
		int allStd = 0;
		int attendanceStd = 0;
		int absentStd = 0;
		int attendNum = 1;
		int attendNum1 = 1;

		
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		ResultSet rs=null;
		ResultSet stdRs = null;
		ResultSet stdRs1 = null;

		Date now = new Date(); // java.util.Date, NOT java.sql.Date or java.sql.Timestamp!
		String format1 = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).format(now);

		
		try {
				String dbURL = "jdbc:mysql://13.209.254.90:57668/webhajo?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
				String dbID = "root";
				String dbPassword = "webhajo123";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		  		pstmt=conn.prepareStatement("SELECT count(*) FROM user WHERE grade = ? AND type = 'student'");	//총 학생 수
		  		pstmt.setInt(1, aNum+1);
		  		rs=pstmt.executeQuery();
				
		  		rs.next();
		  		
		  		allStd = rs.getInt("count(*)");
		  		
		  		
		  		pstmt1=conn.prepareStatement("SELECT count(*) FROM user WHERE grade = ? AND logindt like '"+ format1 +"%' AND type = 'student'");	//오늘 출석한 인원
		  		pstmt1.setInt(1, aNum+1);
		  		rs=pstmt1.executeQuery();
		  		
		  		rs.next();
		  		
				attendanceStd = rs.getInt("count(*)");
				
				absentStd = allStd - attendanceStd;
				
				
		  		pstmt2=conn.prepareStatement("SELECT * FROM user WHERE grade = ? AND type = 'student'");			//학생 명단
		  		pstmt2.setInt(1, aNum+1);
		  		stdRs=pstmt2.executeQuery();
				
		  		
		  		pstmt3=conn.prepareStatement("SELECT * FROM user WHERE grade = ? AND type = 'student'");			//접속 기록
		  		pstmt3.setInt(1, aNum+1);
		  		stdRs1=pstmt3.executeQuery();
		  		 
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
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
		
		<a href="#">
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
					
					<th style="width: 10%;">
						출석여부
					</th>

				</tr>
				<% while(stdRs.next()){ %>
					<tr>
						<td>
							<%=attendNum %>
						</td>
						<td>
							<%=stdRs.getString("name") %>
						</td>
						<td>
							개미와 배짱이
						</td>
						<td>
							3
						</td>
						<td onclick="modalOn('<%=stdRs.getString("userid") %>', '<%=stdRs.getString("name") %>')" >
							버튼
						</td>
						
							<%
							if(stdRs.getString("logindt").substring(0, 10).equals(format1)){
								%>
							<td>
								<div class="circle" style="background-color:green;">
								</div>
							</td>		
							<% 
							}
							else{
							%>
							<td>
								<div class="circle" style="background-color:red;">
								</div>
							</td>
								
							<%
							}
							%>

					</tr>				
					
				<%++attendNum; } %>
			</table>
		</div>
	</div>
	
	<div class="right-frame">
		<div class="attend">
			<h3>
				출석률
			</h3>
			<p><b>학생 수 <%=allStd %>명</b></p>
			<p>출석 인원 <%=attendanceStd %>명</p>
			<p>결석 인원 <%=absentStd %>명 </p>
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
						최근접속시간
					</th>
					<th>
						출석번호
					</th>
					<th>
						학생이름
					</th>
				</tr>
				
				<%while(stdRs1.next()){ %>
				<tr>
					<td>
						<%=stdRs1.getString("logindt") %>
					</td>
					<td>
						<%=attendNum1 %>
					</td>
					<td>
						<%=stdRs1.getString("name") %>
					</td>
				</tr>
				
			<% attendNum1++;}%>
				
				
			</table>
		</div>
	</div>
	
	<div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>피드백</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
            
				<form id="feedbackform" name="feedbackform" action="feedback_process.jsp" method="get">
            		<input type="hidden" name="userid" id="userid" >
            		<label for="name">학생 이름</label>
            		<input type="text" id="name" name="name" readonly="readonly">
            		
            		<label for="game">게임</label>
            		<input type="text" id="game" name="game" readonly="readonly">
            		
            		
            	</form>
                <textarea id="comment" name="comment" form="feedbackform" placeholder="피드백을 입력해주세요..."></textarea>

                <button id="feedback_btn" type="submit" form="feedbackform">확인</button>
            </div>
        </div>
    </div>
</div>

<script>
window.onload = function initTeacher(){
	var aTag = document.getElementsByClassName("left-frame")[0].getElementsByTagName("a")[<%=aNum %>].className = 'select';

}

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
    
    
const modal = document.getElementById("modal")


function modalOn(id, name) {
	document.getElementById("userid").value = id;
	document.getElementById("name").value = name; 
	document.getElementById("game").value = "개미와 배짱이";
	console.log(id);
    modal.style.display = "flex"
}
function isModalOn() {
    return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}

const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
})
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})
</script>
<%@ include file="footer.jsp" %>

