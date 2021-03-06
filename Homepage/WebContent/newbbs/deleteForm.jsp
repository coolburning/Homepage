<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판 삭제</title>
<meta charset="utf-8">

<style type="text/css">
#red {
	color: red;
}

#bbsg{
color:white;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10"><span id="bbsg">삭제</span></h1>
		<form class="form-horizontal" method="post" action="deleteProc.jsp">

			<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
		  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
      <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
      <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd" id="bbsg">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" name="passwd" id="passwd"
						class="form-control">
				</div>
			</div>

			<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">삭제</button>
					<button type="button" class="btn" onclick="location.href='./list.jsp'"
          >목록</button>
				</div>
			</div>


		</form>

	</div>
</body>
</html>
