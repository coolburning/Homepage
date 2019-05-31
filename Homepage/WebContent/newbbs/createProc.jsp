<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>
<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />
<jsp:useBean id="dto" class="newbbs.NewBbsDTO" />
<jsp:setProperty property="*" name="dto" />

<%
	boolean flag = dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<title>게시판 등록 확인</title>
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

	<div class="container" id="bbsga">

		<div class="well well-lg">
			<%
				if (flag == true) {
					out.print("게시판 작성 성공입니다.");
				} else {
					out.print("게시판 작성 실패입니다.");
				}
			%>
			<div>
				<button class="btn" onclick="location.href='./list.jsp'">목록</button>
				<button class="btn" onclick="location.href='./createForm.jsp'">다시등록</button>
			</div>
		</div>
	</div>

</body>
</html>
