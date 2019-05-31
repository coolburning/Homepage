<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>패스워드 변경</title>
<meta charset="utf-8">

<script type="text/javascript">

function incheck(f){
  if(f.passwd.value==""){
    alert("비밀번호를 입력하세요.");
    f.passwd.focus();
    return false;
  }


if(f.repasswd.value==""){
    alert("비밀번호를 확인을 입력하세요.");
    f.passwd.focus();
    return false;
  }

if(f.passwd.value != f.repasswd.value){
  alert("비밀번호가 서로 다릅니다.");
  f.repasswd.value="";
  f.repasswd.focus();
  return false;
}
}

</script>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h2 class="col-sm-offset-2 col-sm-10">패스워드 변경</h2>
		<form class="form-horizontal" method="post" action="updatePwProc.jsp"
		onsubmit="return incheck(this)">

		<input type="hidden" name="id" value="<%=request.getParameter("id")%>">

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">Password</label>
				<div class="col-sm-6">
					<input type="password" name="passwd" id="passwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd">Password 확인</label>
				<div class="col-sm-6">
					<input type="password" name="repasswd" id="repasswd" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn" style=background-color:#F5A9A9>변경</button>
					<button type="button" class="btn" onclick="history.back()" style=background-color:#F5D0A9>취소</button>
				</div>
			</div>


		</form>

	</div>
</body>
</html>
