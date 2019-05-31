<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<jsp:useBean id="dto" class="newmember.NewMemberDTO"/>
<%

UploadSave upload = (UploadSave)request.getAttribute("upload");
dto.setId(upload.getParameter("id"));
dto.setEmail(upload.getParameter("email"));
dto.setPasswd(upload.getParameter("passwd"));
dto.setTel(upload.getParameter("tel"));
dto.setZipcode(upload.getParameter("zipcode"));
dto.setMname(UploadSave.encode(upload.getParameter("mname")));
dto.setJob(UploadSave.encode(upload.getParameter("job")));
dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));

// form의 선택한 파일 받기
FileItem fileItem = upload.getFileItem("fname");
int size = (int)fileItem.getSize();

String fname = UploadSave.saveFile(fileItem, upDir);

if(size>0){
	dto.setFname(fname);
} else {
	dto.setFname("member.jpg");
}

boolean flag = dao.create(dto);

%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입 처리</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />
	<div class="container">
	
	<div class="well well-lg">
	<br>
	<%
	if(flag){
		out.print("회원가입을 했습니다.");
	} else {
		out.print("회원가입을 실패했습니다.");
	}
	%>
  </div>

  <%if(flag){ %>
  
  <button class="btn" type="button" onclick="location.href='loginForm.jsp'">로그인</button>
  <button class="btn" type="button" onclick="location.href='../index.jsp'">홈</button>
  
  <%} else { %>
  
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn" type="button" onclick="history.back()">다시 시도</button>
					<button class="btn" type="button" onclick="location.href='../index.jsp'">홈</button>
				</div>
			</div>
			
   <%} %>
   
	</div>
</body>
</html>
