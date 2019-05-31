<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>

<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<%
UploadSave upload = new UploadSave(request, -1, -1, tempDir);

String id = upload.getParameter("id");
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

FileItem fileItem = upload.getFileItem("fname");

if(oldfile !=null && !oldfile.equals("member.jpg")){
UploadSave.deleteFile(upDir, oldfile); // 원본 파일 삭제
}

String fname = UploadSave.saveFile(fileItem, upDir);
// UploadSave.saveFile(fileItem, upDir); -> fileItem, upDir : ssi에서 가져온것.

Map map = new HashMap();
map.put("id", id);
map.put("fname", fname);

boolean flag = dao.updateFile(map);



%>

<!DOCTYPE html>
<html>
<head>
<title>사진 수정 확인</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">사진 수정 확인</h1>
		<div class="well well-lg">
		<%
		if(flag){
			out.print("사진 수정을 성공 했습니다.");
		} else {
			out.print("사진 수정을 실패 했습니다.");
		}
		%>
		
		</div>
		<button class="btn" onclick="location.href='read.jsp?id=<%=id %>'">나의 정보 보기</button>
		<button class="btn" onclick="history.back()">다시시도</button>

	</div>
</body>
</html>
