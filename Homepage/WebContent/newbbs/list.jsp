<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newbbs.jsp"%>
<jsp:useBean id="dao" class="newbbs.NewBbsDAO" />

<%

// 검색 관련 ------------------
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total"))
		word = "";

// 페이지 관련 -------------------

int nowPage=1; // 현재 보고 있는 페이지
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage = 3; // 한페이지당 보여줄 레코드 갯수


// DB에서 가져올 순번 ------------------

// nowPage : 현재 보고 있는 페이지

int sno = ((nowPage-1)*recordPerPage)+1;
int eno = nowPage*recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = dao.total(col,word);
	
	List<NewBbsDTO> list = dao.list(map);
%>


<!DOCTYPE html>
<html>
<head>
<title>게시판 목록</title>
<meta charset="utf-8">

<script type="text/javascript">
  function read(bbsno) {
    var url = "read.jsp";
    url = url + "?bbsno=" + bbsno;
    
    url += "&col=<%=col%>";
    url += "&word=<%=word%>";
    url += "&nowPage=<%=nowPage%>";

    location.href = url;
  }
  
  function updateM(imgno){
    var url = "updateForm.jsp";
    url += "?imgno=" + imgno;

    url += "&col=<%=col %>";
    url += "&word=<%=word %>";
    url += "&nowPage=<%=nowPage %>";
    
    location.href= url;
  }
  
</script>

<!--  javascript 변수 : url = url + "?bbsno=" + bbsno; -->
<!-- jsp변수 : url += "&col=<%=col%>"; -->
<style type="text/css">
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
		<h2 style=color:white>게시판 목록</h2>

		<br>
		<form class="form-inline" action="./list.jsp">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="wname"
					<% if(col.equals("wname")) out.print("selected"); %>
					>성함</option>
					<option value="title"
					<% if(col.equals("title")) out.print("selected"); %>
					>제목</option>
					<option value="content"
					<% if(col.equals("content")) out.print("selected"); %>
					>내용</option>
					<option value="title_content"
					<% if(col.equals("title_content")) out.print("selected"); %>
					>제목+내용</option>
					<option value="total"
					<% if(col.equals("total")) out.print("selected"); %>
					>전체 출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="<%=word%>">
			</div>
			<button type="submit" class="btn btn-default" style=background-color:#D8D8D8>검색</button>
			<button class="btn" type="button"
				onclick="location.href='./createForm.jsp'"
				style="background-color:#D8D8D8">등록</button>
			<table class="table table-striped">
				<thead>
					<tr>
						<th><span id="bbsg">번호</span></th>
						<th><span id="bbsg">글쓴이</span></th>
						<th><span id="bbsg">제목</span></th>
						<th><span id="bbsg">grpno</span></th>
						<th><span id="bbsg">indent</span></th>
						<th><span id="bbsg">ansnum</span></th>
						<th><span id="bbsg">날짜</span></th>
						<th><span id="bbsg">조회수</span></th>
					</tr>
				</thead>
				<tbody>

					<%
						if (list.size() == 0) {
					%>
					<tr>
						<td colspan="4" style=background-color:#6E6E6E><span id="bbsg">등록된 게시글이 없습니다.</span></td>

						<%
							} else {
								for (int i = 0; i < list.size(); i++) {
									NewBbsDTO dto = list.get(i);
						%>
					
					<tr id="bbsga">
						<td><%=dto.getBbsno()%></td>
						<td><%=dto.getWname()%></td>
						<td>
							<%
								for (int r = 0; r < dto.getIndent(); r++) {
											out.print("&nbsp;&nbsp;");
										}
										if (dto.getIndent() > 0) {
											out.print("<img src='../images/re.jpg'>");
										}
							%> <a id="bbsg" href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
							
							<% if(Utility.compareDay(dto.getWdate())) { %>
						  <img src="../images/new.gif">
							<% } %>
							
						</td>
						<td><%=dto.getGrpno()%></td>
						<td><%=dto.getIndent()%></td>
						<td><%=dto.getAnsnum()%></td>
						<td><%=dto.getWdate()%></td>
						<td><%=dto.getViewcnt()%></td>
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
		</form>
	</div>
</body>
</html>
