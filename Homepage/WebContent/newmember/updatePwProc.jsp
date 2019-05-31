<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<%
String id = request.getParameter("id");
String pw = request.getParameter("passwd");

Map map = new HashMap();
map.put("id", id);
map.put("pw", pw);

boolean flag = dao.updatePw(map);
%> 

<!DOCTYPE html>
<html>
<head>
<title>패스워드 변경 확인</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h2 class="col-sm-offset-2 col-sm-10">패스워드 변경 확인</h2>
		<div class="well well-lg">
		<%
		if(flag){
			out.print("비밀번호를 변경했습니다.");
		} else { 
			out.print("비밀번호 변경 실패 했습니다.");
		}
		%>
		</div>
		
  <button class="btn" onclick="location.href='loginForm.jsp'" style=background-color:#F5A9A9>로그인</button>
  <button class="btn" onclick="history.back()" style=background-color:#F5D0A9>재변경</button>
	
	</div>
</body>
</html>
