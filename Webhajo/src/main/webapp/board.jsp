<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/board.css">
<div>

<div class="container">
      <div class="board">  
		<div class="row">
		<img alt="garland" src="resources/imgs/garland.png" style="margin-bottom: 10px">
			<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd; ">
				<thead class="table-light">
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;"></th>
					</tr>
				</thead>
				<tbody class="table-light">
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getList();
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getBoardID() %></td>
						<td><%= list.get(i).getBoardTitle() %></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시" + list.get(i).getBoardDate().substring(14, 16) + "분 " %></td>
						<td> <a href="boardView.jsp?boardID=<%= list.get(i).getBoardID() %>">글보기</a></td>
					</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<a href="write.jsp" class="btn btn-warning pull-right">글쓰기</a>
			<img alt="cute_tree" src="resources/imgs/cute_tree.png">
		</div>
	</div>
  
  </div>

</div>
<%@ include file="footer.jsp" %>