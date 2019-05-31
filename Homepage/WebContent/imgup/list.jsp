<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_imgup.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>

<%
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if(col.equals("total")) word = "";


int nowPage=1;
if(request.getParameter("nowPage")!=null){
  nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage = 3;

int sno = ((nowPage-1)*recordPerPage)+1;
int eno = nowPage*recordPerPage;

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

int total = dao.total(col, word);
List<ImgUpDTO> list = dao.list(map);
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 목록</title>
<meta charset="utf-8">

<script type="text/javascript">
function read(imgno){
  var url = "read.jsp";
  url = url + "?imgno=" + imgno;
  
  url += "&col=<%=col %>";
  url += "&word=<%=word %>";
  url += "&nowPage=<%=nowPage %>";

  location.href = url;
}

function update(imgno){
  var url = "updateForm.jsp";
  url += "?imgno=" + imgno;

  url += "&col=<%=col %>";
  url += "&word=<%=word %>";
  url += "&nowPage=<%=nowPage %>";
  
  location.href= url;
}

function del(imgno, oldfile){
    var url = "deleteForm.jsp";
    url += "?imgno=" + imgno;

    url += "&oldfile="+oldfile;
    url += "&nowPage=<%=nowPage %>";
    
    location.href=url;
}
</script>

<style>
#bbsg{
color:white;
}

#bbsga{
color:white;
background-color:#6E6E6E;
}
</style>

</head>
<body>

  <jsp:include page="/Menu/top.jsp" />

  <div class="container">
  <h2 style=color:white>Img 목록</h2>
  <br>
  
    <form class="form-inline" action="./list.jsp">
    
      <div class="form-group">
        <select class="form-control" name="col">
        
        <option value="name"
        <% if(col.equals("name")) out.print("selected"); %>
        >성명</option>
        
        <option value="title"
        <% if(col.equals("title")) out.print("selected"); %>
        >제목</option>
        
        <option value="title"
        <% if(col.equals("content")) out.print("selected"); %>
        >내용</option>
        
        <option value="title"
        <% if(col.equals("title_content")) out.print("selected"); %>
        >제목+내용</option>
        
        <option value="title"
        <% if(col.equals("total")) out.print("selected"); %>
        >전체출력</option>
        
        </select>
      </div>

      <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter 검색어"
        name="word" value="<%=word%>">
      </div>

      <button type="submit" class="btn">검색</button>
      <button class="btn" type="button" onclick="location.href='./createForm.jsp'">등록</button>
      
    </form>
    
    
    <table class="table table-striped">
    <thead style=text-align:center>
    <tr>
    <th><span id="bbsg">번호</span></th>
    <th><span id="bbsg">글쓴이</span></th>
    <th><span id="bbsg">사진</span></th>
    <th><span id="bbsg">제목</span></th>
    <th><span id="bbsg">날짜</span></th>
    <th><span id="bbsg">조회수</span></th>
    <th><span id="bbsg">수정/삭제</span></th>
    </tr>
    </thead>
    <tbody>
				<%
          if (list.size() == 0) {
        %>

        <tr>
          <td colspan="5" id="bbsga">등록된 Image가 없습니다.</td>
        </tr>

        <%
          } else {
            for (int i = 0; i < list.size(); i++) {
              ImgUpDTO dto = list.get(i);
        %>
    
    <tr id="bbsga">
    <td><%=dto.getImgno() %></td>
    <td><%=dto.getName() %></td>
    <td class="col-sm-5" style=text-align:center>
    <img src="./storage/<%=dto.getFname()%>"
         class="img-rounded" width="200" height="200"></td>
    <td><a id="bbsg" href="javascript:read('<%=dto.getImgno()%>')"><%=dto.getTitle() %></a></td>
    <td><%=dto.getRegdate() %></td>
    <td><%=dto.getViewcnt() %></td>
    <td><a id="bbsg" href="javascript:update('<%=dto.getImgno()%>')">수정</a>/
        <a id="bbsg" href="javascript:del('<%=dto.getImgno()%>','<%=dto.getFname()%>')">삭제</a></td>
        </tr>
    </tbody>
    <% }} %>
    </table>
    <div>
    <%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
    </div>
  </div>
</body>
</html>
