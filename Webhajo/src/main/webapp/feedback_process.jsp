<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	int id=Integer.parseInt(request.getParameter("userid"));
	String stdName=request.getParameter("name");
	String game=request.getParameter("game");
	String comment=request.getParameter("comment");
	String teacherName =(String)session.getAttribute("name");
	
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	
	try {
		String dbURL = "jdbc:mysql://13.209.254.90:57668/webhajo?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "webhajo123";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
  		pstmt=conn.prepareStatement("INSERT INTO feedback (stdname, content, teachername, game, stdid) VALUES (?, ?, ?, ?, ?)");
  		
  		pstmt.setString(1,stdName);
  		pstmt.setString(2,comment);
  		pstmt.setString(3,teacherName);
  		pstmt.setString(4,game);
  		pstmt.setInt(5,id);
  		int rs=pstmt.executeUpdate();
  		  		
  		if(rs != 0){	
			out.println("<script>");
			out.println("alert('피드백에 성공하셨습니다.')");
		  	out.println("location.href='teacher.jsp'");
 		  	out.println("</script>");
 			
  		}
  		else{
			out.println("<script>");
			out.println("alert('다시 시도해주세요.')");
		  	out.println("location.href='teacher.jsp'");
 		  	out.println("</script>");  			
  		}

	}catch(Exception e){
		out.println("<script>");
	  	out.println("alert('다시 시도해주세요.')");
	  	out.println("location.href=history.back()");
	  	out.println("</script>");  	
		e.printStackTrace();
 	}finally{
 		try{
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 	}
	
%>