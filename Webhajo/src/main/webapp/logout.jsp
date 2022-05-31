<%
	session.invalidate();

	out.println("<script>");
	out.println("location.href='index.jsp'");
	out.println("</script>");
%>