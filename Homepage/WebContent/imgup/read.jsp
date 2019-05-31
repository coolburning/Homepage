<%@page import="oracle.net.aso.r"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="imgup.*, java.util.*"%>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"/>
<%
request.setCharacterEncoding("utf-8");

int imgno = Integer.parseInt(request.getParameter("imgno"));

ImgUpDTO dto = dao.read(imgno);

String content = dto.getContent();

content = content.replaceAll("\r\n", "<br>");

%>

<!DOCTYPE html>
<html>
<head>
<title>Image</title>
<meta charset="utf-8">
</head>
<script type="text/javascript">
function readGo(imgno){
  var url = "./read.jsp";
  url = url + "?imgno="+imgno;
  
  location.href = url;
}

</script>

<style>
#bbsg{
color:white;
}

#font{
color:white;
font-size:40px;
}
</style>
<body>

  <jsp:include page="/Menu/top.jsp" />

  <div class="container">

    <h2 id="bbsg"><%=dto.getName() %>님의 회원 정보</h2>
    <table style=width:50%>

    
    <tr>
    <td colspan="2">
    <img src="./storage/<%=dto.getFname() %>" width="100%">
    </td>
    </tr>
    
    <tr id="font">
    <th>제목</th>
    <td><%=dto.getTitle() %></td>
    </tr>
    
    <tr id="font">
    <th>내용</th>
    <td><%=dto.getContent() %></td>
    </tr>
    
    
    </table>
    
    <table style=width:50%>
    <tr>
    <%
    List list = dao.imgRead(imgno);
    String[] files = (String[])list.get(0);
    int[] noArr = (int[])list.get(1);
    for(int i=0; i<5; i++){
    	if(files[i]==null){
    %>
    <td class="td_padding">
    <img src="./storage/default.jpg" width="50%">
    </td>
    
    <%
    } else{
    	if(noArr[i]==imgno){
    %>
    
    <td class="td_padding">
    <a href="javascript:readGo('<%=noArr[i] %>')">
    <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
    </a>
    </td>
    
    <%
    	} else {
    %>
    
    <td class="td_padding">
    <a href="javascript:readGo('<%=noArr[i] %>')">
    <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
    </a>
    </td>
    <%
    	  }
    }
    }
    %>
    </tr>
    </table>
    
    <div class='bottom'>
    <br>
    <input type='button' class="btn" value='목록' onclick="location.href='list.jsp'">
    <input type='button' class="btn" value='수정' onclick="location.href='updateFileForm.jsp'">
    <input type='button' class="btn" value='삭제' onclick="location.href='deleteForm.jsp'">
    </div>
  </div>
</body>
</html>
