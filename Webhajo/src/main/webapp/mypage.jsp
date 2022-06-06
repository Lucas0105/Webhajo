<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String userid=null;
	String gender=null;
	if ((session.getAttribute("userid")==null)) {
		out.println("<script>");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	}
	
	userid = (String)session.getAttribute("userid");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	PreparedStatement pstmt1=null;
	ResultSet rs1=null;
	
	try {
			String dbURL = "jdbc:mysql://13.209.254.90:57668/webhajo?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "webhajo123";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	  		pstmt=conn.prepareStatement("SELECT * FROM user WHERE userid=?");		//사용자 정보 조회
	  		pstmt.setString(1,userid);
	  		rs=pstmt.executeQuery();

	  		pstmt=conn.prepareStatement("SELECT * FROM feedback WHERE stdid=?");		//피드백 정보 조회
	  		pstmt.setString(1,userid);
	  		rs1=pstmt.executeQuery();
	  		
	  		rs.next();
	  		if(rs.getString("gender").charAt(0) == 'M'){
	  			gender = "남성";
	  		}
	  		else{
	  			gender = "여성";
	  		}
	  		 
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<link rel="stylesheet" href="resources/css/mypage.css">
<div id="introduction">
	<div class= "long-square">
		
		<div class="circle-profile">
			<img src="resources/imgs/hoonbarnom.PNG" alt="프로필 사진" width="150px">			
		</div>
		
		<div class="profile">
			<h2><%=rs.getString("nickname") %></h2>
			<p><%=rs.getString("name") %></p>
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
						<%=rs.getString("school") %>
					</td>
					
					<td>
						닉네임
					</td>
					<td>
						<%=rs.getString("nickname") %>
					</td>
				</tr>
				
				<tr>
					<td>
						학년
					</td>
					<td>
						<%=rs.getString("grade") %>학년
					</td>
					
					<td>
						성별
					</td>
					<td>
						<%=gender %>
					</td>
				</tr>
				
				
				<tr>
					<td>
						이름
					</td>
					<td>
						<%=rs.getString("name") %>
					</td>
					
					<td>
						이메일
					</td>
					<td>
						<%=rs.getString("email") %>
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
				<% while(rs1.next()) { %>
				<tr>
					<td>
						<%=rs1.getString("insertdate").substring(0, 10) %>
						
					</td>
					<td>
						<%=rs1.getString("game") %>
					</td>
					
					<td>
						<%=rs1.getString("content") %>
					</td>
					<td>
						<%=rs1.getString("teachername") %>
					</td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	

	
	
</div>

<%@ include file="footer.jsp" %>