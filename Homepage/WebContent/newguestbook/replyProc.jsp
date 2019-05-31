<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_newguestbook.jsp" %>
<jsp:useBean id="dao" class="newguestbook.NewGuestbookDAO"/>
<jsp:useBean id="dto" class="newguestbook.NewGuestbookDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
Map map = new HashMap();
map.put("grpno", dto.getGrpno());
map.put("ansnum", dto.getAnsnum());

dao.upAnsnum(map);
boolean flag = dao.createReply(dto);
%>

<!DOCTYPE html> 
<html> 
<head>
<title>방명록 답변 처리</title>
<meta charset="utf-8">

<style type="text/css">

#bbsg{
color:black;
}

#bbsga{
color:white;
background-color:#6E6E6E;
}
</style>

</head>
<body>
  <jsp:include page="/Menu/top.jsp" />
<div class="container">
<div class="well well-lg" id="bbsga">
<fieldset>
<legend id="bbsga">방명록 답변 처리</legend>
<%
if(flag==true){
	out.print("방명록 답변 성공 했습니다.");
} else {
	out.print("방명록 답변 실패 했습니다.");
}
%>
</fieldset>

<button type="button" onclick="location.href='createForm.jsp'"
class="btn" id="bbsg">다시 등록</button>
<button type="button" onclick="location.href='list.jsp'"
class="btn" id="bbsg">목록</button>

</div>
</div>
</body> 
</html> 