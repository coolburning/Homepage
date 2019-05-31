<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<%
UploadSave upload = new UploadSave(request, -1, -1, tempDir); // 크기지정 안함, 임시경로

// form의 값을 받는다.
String id = UploadSave.encode(upload.getParameter("id"));
String email = UploadSave.encode(upload.getParameter("email"));

String str = "";

if(dao.duplicateId(id)){
	str="중복된 아이디 입니다. 아이디 중복 확인을 하세요.";
} else if(dao.duplicateEmail(email)){
	str="중복된 이메일 입니다. 이메일 중복 확인을 하세요.";
} else {
	// createProc.jsp 이동해서 db에 회원 정보를 저장
	request.setAttribute("upload", upload);
%>
<jsp:forward page = "/member/createProc.jsp"/>
<%
return;// 더이상 아래 부분 body가 안보이도록 막는 역할
}
%>


<!DOCTYPE html>
<html>
<head>
<title>ID 및 E-mail 중복확인</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">
  <div class="well well-lg">
  <br>
<%=str %>
			
  </div>
<button class="btn" type="button" onclick="history.back()">다시 시도</button>
	</div>
</body>
</html>
