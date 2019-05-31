<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_imgup.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>
<jsp:useBean id="dto" class="imgup.ImgUpDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
boolean flag = dao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 게시글 수정 확인</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">
	
	<h2 class="col-sm-offset-2 col-sm-10">Img 게시글 수정 확인</h2>
	<div class="well well-lg">
	<%
	if(flag){
		out.print("Img 게시글 수정을 성공 했습니다.");
	} else {
		out.print("Img 게시글 수정을 실패 했습니다.");
	}
	%>
	</div>
	
  <button type="button" onclick="location.href='list.jsp'">목록</button>	
	</div>
</body>
</html>
