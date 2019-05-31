<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_imgup.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>

<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String grade = "";

if(imgno==0) {
	imgno = (int)session.getAttribute("imgno");
	grade = (String)session.getAttribute("grade");
}

ImgUpDTO dto = dao.read(imgno);
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 게시판 수정</title>
<meta charset="utf-8">

<script type="text/javascript">
function incheck(f){
  
  if(f.title.value==""){
    alert("제목을 입력하세요.");
    f.title.focus();
    return false;
  }
  
  if(f.content.value==""){
    alert("내용을 입력하세요.");
    f.content.focus();
    return false;
  }
}

</script>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">Img 게시글 수정</h1>
		<form class="form-horizontal" method="post" action="updateProc.jsp" name="frm"
		onsubmit="return incheck(this)">

      <input type="hidden" name="title" value="<%=imgno %>"/>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<label class="col-sm-6">
				</label>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<label class="col-sm-6">
				</label>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>


		</form>

	</div>
</body>
</html>
