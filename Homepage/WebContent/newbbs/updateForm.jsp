<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>

<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	NewBbsDTO dto = dao.read(bbsno);
%>


<!DOCTYPE html>
<html>
<head>
<title>게시판 수정</title>
<meta charset="utf-8">

<style type="text/css">
#bbsg{
color:white;
}

#bbsga{
color:white;
background-color:#6E6E6E;
}

#bbsgb{
background-color:#E6E6E6;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10" id="bbsg">게시판 수정</h1>
		<form class="form-horizontal" method="post" action="updateProc.jsp">

			<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

			<div class="form-group">
				<label class="control-label col-sm-2" for="wname" id="bbsg">글쓴이</label>
				<div class="col-sm-6">
					<input type="text" name="wname" id="wname" class="form-control"
						value="<%=dto.getWname()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="title" id="bbsg">제목</label>
				<div class="col-sm-8">
					<input type="text" name="title" id="title" class="form-control"
						value="<%=dto.getTitle()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content" id="bbsg">내용</label>
				<div class="col-sm-8">
					<textarea rows="12" cols="7" id="content" name="content"
						class="form-control"><%=dto.getContent()%></textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd" id="bbsg">패스워드</label>
				<div class="col-sm-6">
					<input type="password" name="passwd" id="passwd"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">수정</button>
					<button type="reset" class="btn">취소</button>
					<button type="button" class="btn"
						onclick="location.href='./list.jsp'">목록</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>
