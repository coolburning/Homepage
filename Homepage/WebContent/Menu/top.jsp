<%@ page contentType="text/html; charset=UTF-8"%>
<%
String root = request.getContextPath();
String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<title>BoxPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  
#grade {
color:red
}

#login{
color:block;
}

#need1{
color:white;
} 

body  {
  background-image: url("<%=request.getContextPath()%>/모던.jpg");
  background-size: 900px 500px;
  background-color:#6E6E6E;
  background-repeat: repeat-y;
  color:black;
}
</style>
</head>
<body>

  <div class="container">
  
  <div class="navbar-header">
    <a class="navbar-brand" href="#" style=color:white>BOX</a>
    <div class="col-sm-10">
      <%if (id!=null){%>
      <p id="grade"> <%=id %>님의 Box Site 방문을 환영합니다.</p>
      <%} %>
    </div>
  </div>
  
  <ul class="nav navbar-nav">
    <li class="active">
      <a href="<%=root %>/index.jsp">
      <span id="need1" class="glyphicon glyphicon-home"></span>
      </a>
    </li>

    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      <span id="need1">NoticeBoard</span>
      <span class="cret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/newbbs/createForm.jsp">NoticeBoard Create</a></li>
        <li><a href="<%=root%>/newbbs/list.jsp">NoticeBoard List</a></li>
      </ul>
    </li>

    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      <span id="need1">GuestBook</span>
      <span class="cret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/newguestbook/createForm.jsp">GuestBook Create</a></li>
        <li><a href="<%=root%>/newguestbook/list.jsp">GuestBook List</a></li>
      </ul>
    </li>

    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      <span id="need1">Image</span>
      <span class="cret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/imgup/createForm.jsp">Image Create</a></li>
        <li><a href="<%=root%>/imgup/list.jsp">Image List</a></li>
      </ul>
    </li>
  </ul>
  
  <% if(id==null){ %>
  
  <ul class="nav navbar-nav navbar-right">
    <li>
      <a href="<%=root%>/newmember/agreement.jsp">
      <span id="need1">
        <span class="glyphicon glyphicon-user"></span>
        Sign Up</span>
      </a>
    </li>
      
    <li>
      <a href="<%=root%>/newmember/loginForm.jsp">
        <span id="need1"><span class="glyphicon glyphicon-log-in"></span>
        Login</span>
      </a>
    </li>
  </ul>
  
  <% } else{ %>
  
  <ul class="nav navbar-nav navbar-right">
    <li>
      <a href="<%=root%>/newmember/agreement.jsp">
      <span id="need1">
        <span class="glyphicon glyphicon-user"></span>
        Information</span>
      </a>
    </li>
      
    <li>
      <a href="<%=root%>/../updateForm.jsp">
        <span id="need1"><span class="glyphicon glyphicon-log-in"></span>
        Edit Members</span>
      </a>
    </li>
      
    <li>
      <a href="<%=root%>/newmember/logout.jsp">
        <span id="need1"><span class="glyphicon glyphicon-log-in"></span>
        Logout</span>
      </a>
    </li>
  </ul>
      
   
  <% } %>

  </div>
</body>
</html>
