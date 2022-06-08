<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("id") != null){
			userID = (String)session.getAttribute("id");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int boardID = 0;
		if(request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}

		Board board = new BoardDAO().getBoard(boardID);
		if(!userID.equals(board.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='index.jsp'");
			System.out.println(userID);
			System.out.println(board.getUserID());
			script.println("</script>");
		}
	%>
	<div class="container" style="margin-top:30px;">
		<div class="row">
			<form method="post" action="updateAction.jsp?boardID=<%=boardID%>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"
								value="<%= board.getBoardTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048"
								style="height: 350px;"><%=board.getBoardContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글 수정" style="margin-bottom: 10px;  width:100px;">
			 </form>
			    <button class="btn btn-secondary" onclick="cancel()" style="margin-left: 10px; width:100px;">돌아가기</button>
				<script type="text/javascript">
				function cancel(){
					history.back();
				}
				</script>
		</div>
	</div>
</body>
</html>