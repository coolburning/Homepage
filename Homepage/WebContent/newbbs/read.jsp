<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>
<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />

<%
  int bbsno = Integer.parseInt(request.getParameter("bbsno"));
  dao.Viewcnt(bbsno);
  NewBbsDTO dto = dao.read(bbsno);

  String content = dto.getContent().replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<title>Homepage</title>
<meta charset="utf-8">

<script type="text/javascript">

function listM(){
  var url = "list.jsp";
  url=url+"?col=<%=request.getParameter("col") %>";
  url=url+"&word=<%=request.getParameter("word") %>";
  url=url+"&nowPage=<%=request.getParameter("nowPage") %>";
  
  location.href=url;
}

function updateM(){
  var url = "updateForm.jsp";
  url=url+"?bbsno=<%=dto.getBbsno() %>";
  url=url+"&col=<%=request.getParameter("col") %>";
  url=url+"&word=<%=request.getParameter("word") %>";
  url=url+"&nowPage=<%=request.getParameter("nowPage") %>";
  
  location.href=url;
}


function deleteM(bbsno){
  var url = "deleteForm.jsp";
  url=url+"?bbsno=<%=dto.getBbsno() %>";
  url=url+"&col=<%=request.getParameter("col") %>";
  url=url+"&word=<%=request.getParameter("word") %>";
  url=url+"&nowPage=<%=request.getParameter("nowPage") %>";
  
  location.href=url;
}

function replyM(){
  var url = "replyForm.jsp";
  url=url+"?bbsno=<%=dto.getBbsno() %>";
  
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
    <h2 id="bbsg">작성글</h2>
    <div class="panel panel-default">
      <div class="panel-heading" id="bbsga">이름</div>
      <div class="panel-body" id="bbsgb"><%=dto.getWname()%></div>

      <div class="panel-heading" id="bbsga">제목</div>
      <div class="panel-body" id="bbsgb"><%=dto.getTitle()%></div>

      <div class="panel-heading" id="bbsga">내용</div>
      <div class="panel-body" id="bbsgb"><%=dto.getContent()%></div>

      <div class="panel-heading" id="bbsga">조회수</div>
      <div class="panel-body" id="bbsgb"><%=dto.getViewcnt()%></div>

      <div class="panel-heading" id="bbsga">등록일</div>
      <div class="panel-body" id="bbsgb"><%=dto.getWdate()%></div>
    </div>

    <div>
      <button type="button" class="btn"
        onclick="updateM()">수정</button>
      <button type="button" class="btn"
        onclick="deleteM()">삭제</button>
      <button type="button" class="btn"
        onclick="replyM()">답변</button>
      <button type="button" class="btn" onclick="listM()">목록</button>


    </div>


  </div>
</body>
</html>
