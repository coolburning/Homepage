<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<%
String email = request.getParameter("email");

boolean flag = dao.duplicateEmail(email);
%>

<!DOCTYPE html>
<html>
<head>
<title>Email 중복확인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 
 <script type="text/javascript">
function use(){
opener.email.value='<%=email %>';
self.close();
}
</script>

</head>
<body>

<div class="container">
<br><br>

<div class="well well-lg col-sm-7">	
<br><br>

입력된 Email : <%=email %> <br><br>

<%
if(flag){
	out.print("중복되어 사용할 수 없습니다.<br><br>");
}else{
	out.print("중복아님, 사용 가능합니다.<br><br>");
	out.print("<button type='button' onclick='use()' class='btn'>사용</button>");
}
%>


</div>


	<div class="col-sm-offset-2 col-sm-5">
		<button type="button" class="btn" onclick="location.href='emailForm.jsp'" style=background-color:#F5A9A9>다시시도</button>
		<button type="button" class="btn" onclick="window.close()" style=background-color:#F5D0A9>닫기</button>
	</div>
</div>
</body>
</html>
