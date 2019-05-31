<%@ page contentType="text/html; charset=UTF-8"%>

<%

// ----------쿠키설정 내용 시작--------
String c_id=""; // ID 저장 여부를 저장하는 변수, Y
String c_id_val=""; // ID 값
// 2개의 변수 선언


Cookie[] cookies = request.getCookies();
Cookie cookie = null; // 쿠키 배열 선언

if(cookies !=null){
for(int i=0; i<cookies.length; i++){
cookie = cookies[i];

if(cookie.getName().equals("c_id")){
c_id = cookie.getValue(); // Y
} else if(cookie.getName().equals("c_id_val")){
c_id_val = cookie.getValue();//user1...
}
}
}
// ----------쿠키설정 내용 끝--------
%>

<!DOCTYPE html>
<html>
<head>
<title>Login 처리</title>
<meta charset="utf-8">
<script type="text/javascript">
function id_find(){
var url = "id_findForm.jsp";

wr = window.open(url,"아이디 찾기","width=500,height=500");
wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);

}

function passwd_find(){
var url = "passwd_findForm.jsp";

wr = window.open(url,"비밀번호 찾기","width=500,height=500");
wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
}
</script>
</head>
<body>

  <jsp:include page="/Menu/top.jsp" />

  <div class="container">

    <h1 class="col-sm-offset-2 col-sm-10" style=color:white>Login</h1>
    <form class="form-horizontal" method="post" action="loginProc.jsp">

      <div class="form-group">
        <label class="control-label col-sm-2" for="id" style=color:white>ID</label>
        <div class="col-sm-4">
          <input type="text" name="id" id="id" class="form-control" required="required"
          placeholder="ID" value='<%=c_id_val %>'>
          <%if (c_id.equals("Y")){ // id 저장 상태라면          
           %>
           <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장
           <%
           } else {
           %>
           <input type='checkbox' name='c_id' value='Y' > ID 저장
           <%} %>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="passwd" style=color:white>Password
        </label>
        <div class="col-sm-4">
          <input type="password" name="passwd" id="passwd" class="form-control"
          placeholder="Password" required="required">
        </div>
      </div>


      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-7">
          <button type="submit" class="btn">로그인</button>
          <button type="button" class="btn" onclick="location.href='agreement.jsp'">회원가입</button>
          <button type="button" class="btn" onclick="id_find()">ID 찾기</button>
          <button type="button" class="btn" onclick="passwd_find()">Password 찾기</button>
        </div>
      </div>


    </form>

  </div>
</body>
</html>
