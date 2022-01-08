<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestbookDao" %>
<%@ page import="com.javaex.vo.GuestbookVo" %>
    
<%

	//guestboodDao의 insert 쓴
	GuestbookDao guestbookDao = new GuestbookDao();

	//파라미터값 가져오기
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	//guestbookVo에 넣어줘야함
	GuestbookVo guestbookVo = new GuestbookVo(name,password,content);
	
	//저장
	guestbookDao.insert(guestbookVo);

	//리다이렉션
	response.sendRedirect("./addList.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>