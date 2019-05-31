<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_imgup.jsp" %>

<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>
<%
UploadSave upload = new UploadSave(request, -1, -1, tempDir);

int imgno = Integer.parseInt(upload.getParameter("imgno"));
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

FileItem fileItem = upload.getFileItem("name");

if(oldfile !=null && !oldfile.equals("default.jpg")){
	UploadSave.deleteFile(upDir, oldfile);
}

String name = UploadSave.saveFile(fileItem, upDir);

Map map = new HashMap();
map.put("imgno", imgno);
map.put("name", name);

boolean flag = dao.updateFile(map);

%>

<!DOCTYPE html>
<html>
<head>
<title>Image 수정 확인</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">Image 수정 확인</h1>
		<div class="well well-lg">
		<%
		if(flag){
			out.print("Image 수정을 성공 했습니다.");
		} else {
			out.print("Image 수정을 실패 했습니다.");
		}
		%>
		</div>
		<button type="button" onclick="location.href='list.jsp'">목록</button> 
    <button class="btn" onclick="history.back()">다시시도</button>
	</div>
</body>
</html>
