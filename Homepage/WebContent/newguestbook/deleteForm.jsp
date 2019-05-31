<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="/ssi/ssi_newguestbook.jsp" %>


<!DOCTYPE html> 
<html> 
<head>
<title>방명록 삭제</title>
<meta charset="utf-8">
<style type="text/css">
#need{
color:red;
}
</style>

</head>
<body>
  <jsp:include page="/Menu/top.jsp" />
<div class="container">
<h2 class="col-sm-offset-4 col-sm-8">방명록 삭제</h2>
<form class="form-horizontal" method="post" action=deleteProc.jsp onsubmit="return incheck(this)">
 <input type="hidden" name="no" value="<%=request.getParameter("no") %>">
<div class="jumbotron">
<h3>삭제 확인</h3>
<p>삭제를 하면 복구 될 수 없습니다.<br>
삭제하시려면 삭제버튼을 클릭하세요.<br>
취소는 목록 버튼을 누르새요
</p>
</div>

<button class="btn">삭제</button>
<button class="btn" type="button" onclick="location.href='list.jsp'">목록</button>

</form>



</div>
</body> 
</html>