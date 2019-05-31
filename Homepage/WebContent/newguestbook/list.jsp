<%@page import="javax.rmi.CORBA.Util"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newguestbook.jsp"%>
<jsp:useBean id="dao" class="newguestbook.NewGuestbookDAO" />
<%

// 검색 관련
  String col = Utility.checkNull(request.getParameter("col"));
  String word = Utility.checkNull(request.getParameter("word"));

  if (col.equals("total"))
    word = "";
  
// 페이지 관련

int nowPage=1;
if(request.getParameter("nowPage")!=null){
  nowPage=Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage = 3;


int sno = ((nowPage-1)*recordPerPage)+1; // 시작
int eno = nowPage*recordPerPage; // 끝

  Map map = new HashMap();
  map.put("col", col);
  map.put("word", word);
  map.put("sno", sno);
  map.put("eno", eno);

  int total = dao.total(map);
  
  List<NewGuestbookDTO> list = dao.list(map);
%>


<!DOCTYPE html>
<html>
<head>
<title>방명록 목록</title>
<meta charset="utf-8">

  <script type="text/javascript">
  function read(no) {
    var url = "read.jsp";
    url = url + "?no=" + no;

    location.href = url;
  }
  
  function update(no){
    var url="updateForm.jsp";
    url+="?no="+no;
    location.href=url;
  }

  function del(no){
    if(confirm("정말 삭제 하시겠습니까?")){
      var url="deleteProc.jsp";
      url+="?no="+no;
      location.href=url;
    }
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

body  {
  background-image: url("./모던.jpg");
  background-size: 900px 500px;
  background-color:#6E6E6E;
  background-repeat: repeat-y;
  color:black;
}
</style>
</head>

<body>
  <jsp:include page="/Menu/top.jsp" />
  <div class="container">

    <h2 style=color:white>방명록 목록</h2>
    <br>
    <form class="form-inline" method="post" action="./list.jsp">
      <div class="form-group">
        <select class="form-control" name="col">
          <option value="name"
            <%if (col.equals("name"))
        out.print("selected");%>>성함</option>
          <option value="title"
            <%if (col.equals("title"))
        out.print("selected");%>>제목</option>
          <option value="content"
            <%if (col.equals("content"))
        out.print("selected");%>>내용</option>
          <option value="part"
            <%if (col.equals("part"))
        out.print("selected");%>>파트</option>
          <option value="total"
            <%if (col.equals("total"))
        out.print("selected");%>>전체
            출력</option>
        </select>
      </div>

      <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter 검색"
          name="word" value="<%=word %>">
      </div>

      <button class="btn btn-default" style=background-color:#D8D8D8>검색</button>
      <button type="button" class="btn btn-default"
        style=background-color:#D8D8D8 onclick="location.href='createForm.jsp'">작성</button>
    </form>

    <table class="table table-striped">
      <thead>
        <tr>
          <td><span id="bbsg">번호</span></td>
          <td><span id="bbsg">제목</span></td>
          <td><span id="bbsg">이름</span></td>
          <td><span id="bbsg">파트</span></td>
          <td><span id="bbsg">날짜</span></td>
          <td><span id="bbsg">grpno</span></td>
          <td><span id="bbsg">indent</span></td>
          <td><span id="bbsg">ansnum</span></td>
          <td><span id="bbsg">수정/삭제</span></td>
        </tr>
      </thead>
      <tbody>
        <%
          if (list.size() == 0) {
        %>

        <tr>
          <td colspan="5">등록된 방명록이 없습니다.</td>
        </tr>

        <%
          } else {
            for (int i = 0; i < list.size(); i++) {
              NewGuestbookDTO dto = list.get(i);
        %>

        <tr id="bbsga">
          <td><%=dto.getNo()%></td>
          <td>
              <%
                for (int r = 0; r < dto.getIndent(); r++) {
                      out.print("&nbsp;&nbsp;");
                    }
                    if (dto.getIndent() > 0) {
                      out.print("<img src='../images/re.jpg'>");
                    }
              %> <a id="bbsg" href="javascript:read('<%=dto.getNo()%>')"><%=dto.getTitle()%></a>
            <% if(Utility.compareDay(dto.getRegdate())) { %>
            <img src="../images/new.gif">
            <% } %>
            </td>
          <td><%=dto.getName()%></td>
          <td><%=dto.getPartstr()%></td>
          <td><%=dto.getRegdate()%></td>
          <td><%=dto.getGrpno() %></td>
          <td><%=dto.getIndent() %></td>
          <td><%=dto.getAnsnum() %></td>
          <td><a id="bbsg" href="javascript:update('<%=dto.getNo()%>')">수정</a>/ <a
            id="bbsg" href="javascript:del('<%=dto.getNo()%>')">삭제</a></td>
        </tr>

        <%
          }
          }
        %>

      </tbody>
    </table>
    <div>
    <%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
    </div>

  </div>
</body>
</html>
