<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_newguestbook.jsp" %>
<jsp:useBean id="dao" class="newguestbook.NewGuestbookDAO"/>
<jsp:useBean id="dto" class="newguestbook.NewGuestbookDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
boolean flag=dao.create(dto);
%>

<!DOCTYPE html> 
<html> 
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

<style type="text/css">
#bbsg{
color:white;
}
</style>


</head>
<body>

  <jsp:include page="/Menu/top.jsp" />
<div class="container">

<fieldset>
<legend id="bbsg">방명록 작성 확인</legend>

<span id="bbsg">
<%
if(flag==true){
	out.print("방명록 작성 성공 했습니다.");
} else {
	out.print("방명록 작성 실패 했습니다.");
}
%>
</span>
</fieldset>

<button type="button" class="btn" onclick="location.href='createForm.jsp'">다시 등록</button>
<button type="button" class="btn" onclick="location.href='list.jsp'">등록  확인</button>

</div>
</body> 
</html> 