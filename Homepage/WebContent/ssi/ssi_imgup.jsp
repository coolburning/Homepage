<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="imgup.ImgUpDAO"%>
<%@ page import="imgup.ImgUpDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<% request.setCharacterEncoding("utf-8"); 

String root = request.getContextPath(); //절대경로

String upDir = "/imgup/storage";
String tempDir = "/imgup/temp"; //임시폴더

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);
%>