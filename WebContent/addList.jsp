<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>

<%@ page import="com.javaex.dao.GuestbookDao" %>
<%@ page import="com.javaex.vo.GuestbookVo" %>

<%
	//GuestbookDao써야지 일단
	GuestbookDao guestbookDao = new GuestbookDao();
	List<GuestbookVo> gbList = guestbookDao.getList();	
	
 %>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 등록폼영역 -->
	<form action="./add.jsp" method="get" >
	<table border="2" width="500px">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value=""></td>
			<td>비밀번호</td>
			<td><input type="password" name="password" value=""></td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea cols="65" rows="5" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="submit">작성하기</button>
			</td>
		</tr>
	</table>
	</form>
	<br>
	
	<!-- 리스트영역 -->
		<!-- 0부터 시작하기 때문에 <=아니고 <guestbookList.size -->
	<% for(int i=0; i<gbList.size(); i++){ %>
		<table border="2" width="500px">
		<tr>
			<td><%=gbList.get(i).getNo()%></td>
			<td><%=gbList.get(i).getName()%></td>
			<td><%=gbList.get(i).getRegDate()%></td>
			<td><a href="./deleteForm.jsp?no=<%=gbList.get(i).getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4">
				<%=gbList.get(i).getContent()%>
			</td>
		</tr>
	</table>
	<br>
	<% } %>
	
	
	
	
	
	
	
	
</body>
</html>