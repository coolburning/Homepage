<%@ page contentType="text/html; charset=UTF-8"%>
<%
session.invalidate(); // 모든 session 변수 삭제
response.sendRedirect("../index.jsp");
%>