<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/boardView.css">

<%
    String userId = null;
    if (session.getAttribute("userID") != null) {
        userId = (String) session.getAttribute("userID");
    }
    String boardID = request.getParameter("boardID");

    System.out.println("boardID : " + boardID);

    BoardDAO boardDAO = new BoardDAO();
    Board board = boardDAO.getBoard(Integer.parseInt(boardID));
%>

<div class="container">
    <div class="boardview">
    <div class="row">
        <table class="table table-striped" style="margin-top:30px;  text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;">제목</td>
                <td><%= board.getBoardTitle() %>
                </td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%= board.getUserID() %>
                </td>
            </tr>
            <tr>
                <td>작성일자</td>
                <td><%= board.getBoardDate() %>
                </td>
            </tr>
            <tr>
                <td >내용</td>
                <td style="height: 50vh; text-align: left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
                </td>
            </tr>
            </tbody>
        </table>
        <button class="btn btn-secondary pull-right" onclick="cancel()" style="margin-bottom:10px;">돌아가기</button>
		<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-primary">수정</a>
        
        <script type="text/javascript">
				function cancel(){
					history.back();
				}
		</script>
   </div>
    
    </div>
</div>

<%@ include file="footer.jsp" %>