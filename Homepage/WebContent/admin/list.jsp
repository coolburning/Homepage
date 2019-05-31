<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp"%>
<jsp:useBean id="dao" class="newmember.NewMemberDAO" />

<%
	// 검색 관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total"))
		word = "";

	// 페이지 관련
	int nowPage = 1;
	int recordPerPage = 3;

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = dao.total(map);

	List<NewMemberDTO> list = dao.list(map);

	String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
%>

<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
<meta charset="utf-8">

<script type="text/javascript">

function read(id){
var url = "<%=root %>/member/read.jsp";
url += "?id="+id;

location.href=url;
}

</script>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">회원 목록</h1>

		<form class="form-inline" action="./list.jsp">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="mname"
						<%if (col.equals("mname"))
				out.print("selected");%>>이름</option>
					<option value="id"
						<%if (col.equals("id"))
				out.print("selected");%>>ID</option>
					<option value="email"
						<%if (col.equals("email"))
				out.print("selected");%>>E-mail</option>
					<option value="total"
						<%if (col.equals("total"))
				out.print("selected");%>>전체출력</option>
				</select>
			</div>

			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색"
					name="word" value="<%=word%>">
			</div>

			<button class="btn btn-default">검색</button>
			<button type="button" class="btn btn-default"
				onclick="location.href='createForm.jsp'">등록</button>

		</form>

		<%
			for (int i = 0; i < list.size(); i++) {
				NewMemberDTO dto = list.get(i);
		%>
		<table class="table table-bordered">

			<tr>
				<td rowspan="5" class="col-sm-5" style=text-align:center>
				<img src="<%=root %>/member/storage/<%=dto.getFname()%>"
					class="img-rounded" width="200" height="200"></td>

				<th class="col-sm-2">ID</th>
				<td class="col-sm-8"><a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a></td>
			</tr>

			<tr>
				<th class="col-sm-2">성명</th>
				<td class="col-sm-8"><%=dto.getMname()%></td>
			</tr>

			<tr>
				<th class="col-sm-2">전화번호</th>
				<td class="col-sm-8"><%=dto.getTel()%></td>
			</tr>

			<tr>
				<th class="col-sm-2">이메일</th>
				<td class="col-sm-8"><%=dto.getEmail()%></td>
			</tr>

			<tr>
				<th class="col-sm-2">주소</th>
				<td class="col-sm-8">(<%=dto.getZipcode()%>) <%=dto.getAddress1()%> <%=dto.getAddress2()%>
				</td>
			</tr>

		</table>
		<%
			}
		%>
		<%=paging%>
	</div>
</body>
</html>
