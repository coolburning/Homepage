<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>
<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />

<%

int bbsno = Integer.parseInt(request.getParameter("bbsno"));
String passwd = request.getParameter("passwd");
  Map map = new HashMap();
  map.put("bbsno", bbsno);
  map.put("passwd", passwd);
  
	boolean flag = false;
  boolean pflag = dao.passCheck(map);
  if(pflag){
	  flag = dao.delete(bbsno);
  }
%>

<!DOCTYPE html>
<html>
<head>
<title>게시판 삭제 확인</title>
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
					out.print("글 삭제를 성공 했습니다.");
				} else {
					out.print("글 삭제를 실패 했습니다.");
				}
			%>
			<div>
			<% if(!pflag){ %>
				<button class="btn" onclick="history.back()" id="bbsg">다시 시도</button>
			<% } %>
				<button class="btn" onclick="listM()" id="bbsg">목록</button>
				
			</div>
		</div>
	</div>

</body>
</html>
