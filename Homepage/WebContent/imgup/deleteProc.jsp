<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_imgup.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String passwd = request.getParameter("passwd");
String oldfile = request.getParameter("oldfile");

Map map = new HashMap();
map.put("imgno", imgno);
map.put("passwd", passwd);

boolean flag = false;
boolean pflag = dao.passCheck(map);
if(pflag){
	flag = dao.delete(imgno);
}

if(flag)UploadSave.deleteFile(upDir, oldfile);
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 게시판 삭제 확인</title>
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

<style>
#bbsga{
color:white;
background-color:#6E6E6E;
font-size:25px;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">
	<br>
	<span id="bbsga">
	<%
	if(!pflag){
		out.print("잘못된 비밀번호 입니다.");
	} else if(flag) {
		out.print("이미지 게시글 삭제 성공 했습니다.");
	} else {
		out.print("이미지 게시글 삭제 실패 했습니다.");
	}
	%>
	</span>
	<div>
	<br>
	<% if(!pflag){ %>
	<button class="btn" onclick="history.back()">다시 시도</button>
	<% } %>
	<button class="btn" onclick="listM()">목록</button>
	</div>
	
	</div>
</body>
</html>
