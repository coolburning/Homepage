<%@ page contentType="text/html; charset=UTF-8"%>
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String oldfile = request.getParameter("oldfile");
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 게시판 삭제</title>
<meta charset="utf-8">

<script type="text/javascript">
function incheck(f){
  if(f.password.value == ''){
    alert('비밀번호를 입력하세요.');
    f.password.focus();
    return false;
  }  
  if(confirm('한번삭제불가')==false){
    return false;
  }
}
</script>

<style>
#bbsg{
color:white;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h2 class="col-sm-offset-2 col-sm-10" id="bbsg">삭제</h2>
    <form class="form-horizontal" action="deleteProc.jsp" method="post">

		<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		<input type="hidden" name="imgno" value="<%=imgno %>">
		<input type="hidden" name="oldfile" value="<%=oldfile %>">
		
		
		
		<div class="form-group">
		<label class="control-label col-sm-2" for="passwd" id="bbsg">비밀번호</label>
		<div class="col-sm-6">
		<input type="password" name="passwd" id="passwd" class="form-control">
		</div>
		
		
		
		<div class="form-group">
		<div class="col-sm-offset-2 col-sm-5">
		<br>
		<button class="btn">삭제</button>
		<button type="button" class="btn" onclick="location.href='./list.jsp'">취소</button>
		</div>
		</div>
		<p id="bbsg">삭제하면 복구할수 없습니다.</p>
		</div>
		</form> 
	</div>
</body>
</html>
