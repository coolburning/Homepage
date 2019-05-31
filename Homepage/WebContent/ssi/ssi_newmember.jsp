<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="newmember.NewMemberDAO" %>
<%@ page import="newmember.NewMemberDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<% request.setCharacterEncoding("utf-8"); 

String root = request.getContextPath();

String upDir = "/member/storage";
String tempDir = "/member/temp";

upDir = application.getRealPath(upDir);
tempDir = application.getRealPath(tempDir);
%>
 
