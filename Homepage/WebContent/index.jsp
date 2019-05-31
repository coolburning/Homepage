<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>Box MainPage</title>
<meta charset="utf-8">
<style type="text/css">
#h2{
color:white;
}

.jumbotron{
background-image:url("./흑백시계.png");
background-size:cover;
text-shadow:white 0.2em 0.2em 0.2em;
color:white;
}
</style>

</head>
<body>

  <jsp:include page="/Menu/top.jsp"/>

  <div class="container">
  
  <div class="jumbotron" style=color-font:white><br>
  <h2 class="text-center">BOX Site</h2>
  </div>
  
  <article class="photo container">
  <div class="row">
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
  <img src="./흑백조커.png" alt="..." style=width:280px>
  </div>
  </div>
  
  
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
  <img src="./종이배.jpg" alt="..." style=width:270px>
  </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
  <img src="./흑백도시1.png" alt="..." style=width:280px>
  </div>
  </div>
  </div>
  </article>
  
  <article class="photo container">
  <div class="row">
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
  <img src="./도시1.jpg" alt="..." style=width:265px>
  </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
  <img src="./도시2.jpg" alt="..." style=width:300px>
  </div>
  </div>
  
  <div class="col-sm-6 col-md-4">
  <div class="thumbnail">
  <img src="./도시3.png" alt="..." style=width:300px>
  </div>
  </div>
  </div>
  
  </article>
  
  <div class="col-md-4 mxauto">
  <h5 class="font-weight-bold text-uppercase mt-3 mb-4" style=color:white>Footer</h5>
  <p style=color:white>Hi..</p>
  </div>
  
  <hr class="clearfix w-100 d-md-none">
  <div class="col-md-2 mx-auto">
  <h5 class="font-weight-bold text-uppercase mt-3 mb-4" style=color:white>NoticeBoard</h5>
  
  <ul class="list-unstyled">
  <li>
  <a href="#" style=color:white>Create</a>
  </li>
  
  <li>
  <a href="#" style=color:white>List</a>
  </li>
  
  <li>
  <a href="#" style=color:white>Link 1</a>
  </li>
  
  <li>
  <a href="#" style=color:white>Link 2</a>
  </li>
  </ul>
  </div>
  
  <!-- ---------------------------------------------------------------- -->
  
  <div class="col-md-2 mx-auto">
  <h5 class="font-weight-bold text-uppercase mt-3 mb-4" style=color:white>GuestBook</h5>
  
  <ul class="list-unstyled">
  <li>
  <a href="#" style=color:white>Create</a>
  </li>
  
  <li>
  <a href="#" style=color:white>List</a>
  </li>
  
  <li>
  <a href="#" style=color:white>Link 1</a>
  </li>
  
  <li>
  <a href="#" style=color:white>Link 2</a>
  </li>
  </ul>
  </div>
  </div>
  
  <!-- ---------------------------------------------------------------- -->

  <audio src="src/별빛나비.mp3" autoplay controls>
  </audio>

</body>
</html>
