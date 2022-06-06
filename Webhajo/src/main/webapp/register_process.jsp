<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%

	request.setCharacterEncoding("UTF-8");
	String user = request.getParameter("user");
	String gender = request.getParameter("gender");
	String nickname = request.getParameter("nickname");
	String userName = request.getParameter("userName");
	int grade = Integer.parseInt(request.getParameter("grade"));
	String userEmail= request.getParameter("userEmail");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	
	try {
		String dbURL = "jdbc:mysql://13.209.254.90:57668/webhajo?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "webhajo123";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
  		pstmt=conn.prepareStatement("INSERT INTO user (name, id, email, password, grade, type, gender, nickname) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
  		pstmt.setString(1,userName);
  		pstmt.setString(2,userId);
  		pstmt.setString(3,userEmail);
  		pstmt.setString(4,userPw);
  		pstmt.setInt(5,grade);
  		pstmt.setString(6,user);
  		pstmt.setString(7,gender);
  		pstmt.setString(8,nickname);
  		int rs=pstmt.executeUpdate();
  		  		
  		if(rs != 0){	
			out.println("<script>");
			out.println("alert('회원가입에 성공하셨습니다.')");
		  	out.println("location.href='login.jsp'");
 		  	out.println("</script>");
 			
  		}
  		else{
			out.println("<script>");
		  	out.println("location.href='register_step3.jsp'");
 		  	out.println("</script>");  			
  		}

	}catch(Exception e){
		out.println("<script>");
	  	out.println("alert('이미 존재하는 Id 입니다.')");
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