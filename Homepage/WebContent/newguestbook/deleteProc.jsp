<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_newguestbook.jsp" %>

<%
int no = Integer.parseInt(request.getParameter("no"));

NewGuestbookDAO dao = new NewGuestbookDAO();
boolean flag = dao.delete(no);
%>

<!DOCTYPE html> 
<html> 
<head>
<title>방명록 삭제 확인</title>
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
<legend id="bbsg">방명록 삭제 확인</legend>

<span id="bbsg">
<%
if(flag==true){
	out.print("방명록 삭제 성공 했습니다.");
} else {
	out.print("방명록 삭제 실패 했습니다.");
}
%>
</span>
</fieldset>

<button type="button" class="btn" onclick="location.href='createForm.jsp'"
style=background-color:#D8D8D8>다시 등록</button>
<button type="button" class="btn" onclick="location.href='list.jsp'"
style=background-color:#D8D8D8>목록</button>

</div>
</body> 
</html> 