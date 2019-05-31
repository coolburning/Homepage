<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_imgup.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>
<jsp:useBean id="dto" class="imgup.ImgUpDTO"/>

<%
UploadSave upload = new UploadSave(request, -1, -1, tempDir);
dto.setTitle(upload.getParameter("title"));
dto.setContent(upload.getParameter("content"));
dto.setName(upload.getParameter("name"));
dto.setPasswd(upload.getParameter("passwd"));

FileItem fileItem = upload.getFileItem("fname");
int size = (int)fileItem.getSize();

String fname = UploadSave.saveFile(fileItem, upDir);

if(size>0){
	dto.setFname(fname);
} else {
	dto.setFname("defult.jpg");
}

boolean flag=dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 게시글 등록 확인</title>
<meta charset="utf-8">

<style>
#bbsg{
color:white;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">
    
    <fieldset id="bbsg">
    <legend id="bbsg">Img 게시글 등록 확인</legend>
		<%
		if(flag==true){
			out.print("Img 게시글 등록 성공 했습니다.");
		} else {
			out.print("Img 게시글 등록 실패 했습니다.");
		}
		%>
		</fieldset>
		<br>
		<button type="button" class="btn" onclick="location.href='createForm.jsp'">다시 등록</button>
		<button type="button" class="btn" onclick="location.href='list.jsp'">등록 확인</button>
		

	</div>
</body>
</html>
