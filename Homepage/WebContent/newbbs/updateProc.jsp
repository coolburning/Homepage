<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>
<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />
<jsp:useBean id="dto" class="newbbs.NewBbsDTO" />
<jsp:setProperty property="*" name="dto" />

<%
  Map map = new HashMap();
  map.put("bbsno", dto.getBbsno());
  map.put("passwd", dto.getPasswd());
  
	boolean flag = false;
  boolean pflag = dao.passCheck(map);
  if(pflag){
	  flag = dao.update(dto);
  }
%>

<!DOCTYPE html>
<html>
<head>
<title>게시판 수정 확인</title>
<meta charset="utf-8">

<script type="text/javascript">
function listM(){
  var url = "list.jsp";
  url += "?col=<%=request.getParameter("col")%>";
  url += "&word=<%=request.getParameter("word")%>";
  url += "&nowPage=<%=request.getParameter("nowPage")%>";
  
  location.href=url;
}

</script>

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
				if (!pflag) {
					out.print("잘못된 비밀번호 입니다.");
				} else if(flag){
					out.print("글 수정을 성공 했습니다.");
				} else {
					out.print("글 수정을 실패 했습니다.");
				}
			%>
			<div>
			<% if(!pflag){ %>
				<button class="btn" onclick="history.back()" id="bbsg">다시 시도</button>
			<% } %>
				<button class="btn" onclick="location.href='./createForm.jsp'" id="bbsg">추가 등록</button>
				<button class="btn" onclick="listM()" id="bbsg">목록</button>
				
			</div>
		</div>
	</div>

</body>
</html>
