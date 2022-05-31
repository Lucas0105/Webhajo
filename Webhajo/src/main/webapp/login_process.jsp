<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id=request.getParameter("userId");
	String pass=request.getParameter("password");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		String dbURL = "jdbc:mysql://13.209.254.90:57668/webhajo?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "webhajo123";
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
  		pstmt=conn.prepareStatement("SELECT * FROM user WHERE id=?");
  		pstmt.setString(1,id);
  		rs=pstmt.executeQuery();
  		  		
  		if(rs.next()){
  			if(pass.equals(rs.getString("password"))){
  				session.setAttribute("id",id);
  				session.setAttribute("userid",rs.getString("userid"));
  				session.setAttribute("type",rs.getString("type"));
  				session.setAttribute("nickname",rs.getString("nickname"));
  				
  				out.println("<script>");
  		  		out.println("location.href='index.jsp'");
  		  		out.println("</script>");
  			}
  		}
  		
  		System.out.println(session.getAttribute("userid"));
  		System.out.println(session.getAttribute("type"));
  		System.out.println(session.getAttribute("nickname"));
  		out.println("<script>");
		out.println("alert('아이디 혹은 비밀번호가 틀렸습니다.')");
  		out.println("history.back()");
  		//out.println("location.href='login.jsp'");
  		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
 	}finally{
 		try{
 			rs.close();
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 	}
%>