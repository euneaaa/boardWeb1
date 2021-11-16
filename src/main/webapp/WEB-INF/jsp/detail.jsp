<%@ page import="com.koreait.board.BoardVO" %>
<%@ page import="com.koreait.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BoardVO vo = (BoardVO) request.getAttribute("detail");
    String strIboard = request.getParameter("iboard");
    int prevIboard = (int)request.getAttribute("prevIdx");
    int nextIboard = (int)request.getAttribute("nextIdx");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <div>
        <% if(prevIboard != 0){%>
            <a href="/detail?iboard=<%=prevIboard%>"><input type="button" value="이전글"></a>
        <% }%>

        <% if(nextIboard != 0){%>
            <a href="/detail?iboard=<%=nextIboard%>"><input type="button" value="다음글"></a>
        <% }%>
    </div>
    <br>
    <div>
        <a href="/del?iboard=<%=vo.getIboard() %>"><input type="button" id="delBtn" value="삭제"></a>
        <a href="/mod?iboard=<%=vo.getIboard() %>"><input type="button" value="수정"></a>
    </div>
    <div>제목 : <%= vo.getTitle() %></div>
    <div>작성자 : <%= vo.getWriter() %></div>
    <div>작성일시 : <%= vo.getRdt() %></div>
    <div><%= vo.getCtnt() %></div>
    <img src="https://item.kakaocdn.net/do/8f76407f0a19e2ce0f69abba5693e633f43ad912ad8dd55b04db6a64cddaf76d"/>
</body>
</html>
