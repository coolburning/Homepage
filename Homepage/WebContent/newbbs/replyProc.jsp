<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>
<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />
<jsp:useBean id="dto" class="newbbs.NewBbsDTO" />
<jsp:setProperty property="*" name="dto" />

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
<title>게시판 답변 처리</title>
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
			<%
				if (flag == true) {
					out.print("게시판 답변 성공입니다.");
				} else {
					out.print("게시판 답변 실패입니다.");
				}
			%>
			<div>
				<button class="btn" onclick="location.href='./list.jsp'"
				id="bbsg">목록</button>
				<button class="btn" onclick="location.href='./createForm.jsp'"
				id="bbsg">다시등록</button>
			</div>
		</div>
	</div>

</body>
</html>
