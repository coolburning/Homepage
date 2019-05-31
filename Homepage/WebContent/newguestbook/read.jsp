<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_newguestbook.jsp" %> 
<jsp:useBean id="dao" class="newguestbook.NewGuestbookDAO" />
<%
  int no = Integer.parseInt(request.getParameter("no"));
  NewGuestbookDTO dto = dao.read(no);
%>
 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
<script type="text/javascript">
function updateM(){
  var url = "updateForm.jsp";
  url=url+"?no=<%=dto.getNo() %>";
  
  location.href=url;
}

function deleteM(no){
  var url = "deleteForm.jsp";
  url=url+"?no=<%=dto.getNo() %>";
  
  location.href=url;
}

function replyM(){
  var url = "replyForm.jsp";
  url=url+"?no=<%=dto.getNo() %>";
  
  location.href=url;
}

</script>

<style type="text/css">
#bbsg{
color:white;
}

#bbsga{
color:white;
background-color:#6E6E6E;
}

#bbsgb{
background-color:#E6E6E6;
}

</style>

</head>
<body>
  <jsp:include page="/Menu/top.jsp" />
<div class="container">
  <h2 id="bbsg">방명록 내용</h2>
  <div class="panel panel-default">
       <div class="panel-heading" id="bbsga">번호</div>
       <div class="panel-body" id="bbsgb"><%=dto.getNo() %></div>
       <div class="panel-heading" id="bbsga">이름</div>
       <div class="panel-body" id="bbsgb"><%=dto.getName() %></div>
       <div class="panel-heading" id="bbsga">성별</div>
       <div class="panel-body" id="bbsgb"><%=dto.getGender() %></div>
       <div class="panel-heading" id="bbsga">제목</div>
       <div class="panel-body" id="bbsgb"><%=dto.getTitle() %></div>
       <div class="panel-heading" id="bbsga">내용</div>
       <div class="panel-body" id="bbsgb"><%=dto.getContent() %></div>
       <div class="panel-heading" id="bbsga">날짜</div>
       <div class="panel-body" id="bbsgb"><%=dto.getRegdate() %></div>
       <div class="panel-heading" id="bbsga">파트</div>
        <div class="panel-body" id="bbsgb"><%=dto.getPartstr() %></div>
  </div>
 
<button class="btn" type="button" onclick="updateM()">수정</button>
<button class="btn" type="button" onclick="deleteM()">삭제</button>
<button class="btn" type="button" onclick="replyM()">답변</button>
<button class="btn" type="button" onclick="location.href='list.jsp'">목록</button>
</div>
</body> 
</html> 
