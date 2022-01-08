<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.vo.GuestbookVo" %>
<%@ page import="com.javaex.dao.GuestbookDao" %>

<%
request.setCharacterEncoding("UTF-8");

//parseInt : int String 변환
int no = Integer.parseInt(request.getParameter("no"));
//request 안의 파라미터값 가져오기
String password = request.getParameter("password");

//GuestbookVo guestbookVo = new GuestbookVo(no, password);
//파라미터 2개짜리 생성자가 없기 때문에 오류 (no, password 있는), vo에서 새로 만들어주거나 아래처럼 기본생성자 써서 처리

//기본생성자 사용하고 setter 사용해서 값 초기화(BookVo)
GuestbookVo guestbookVo = new GuestbookVo();
guestbookVo.setNo(no);
guestbookVo.setPassword(password);

GuestbookDao guestbookDao = new GuestbookDao();
guestbookDao.delete(guestbookVo);
//dao를 메모리에 올리고 delete를 만들어서 위에서 만든 guestbookDao 생성자를 올려준다

response.sendRedirect("./addList.jsp");
%>
