<%@ page contentType="text/html; charset=UTF-8"%>
<%
int imgno = Integer.parseInt(request.getParameter("id"));
String oldfile = request.getParameter("oldfile");
%>

<!DOCTYPE html>
<html>
<head>
<title>Image 수정</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">Image 수정</h1>
		<form class="form-horizontal" method="post" action="updateFileProc.jsp"
		enctype="multipart/form-data">
		<input type="hidden" name="imgno" value="<%=imgno%>">
		<input type="hidden" name="oldfile" value="<%=oldfile%>">

			<div class="form-group">
				<label class="control-label col-sm-2" for="title">원본 Image</label>
				<div class="col-sm-6">
					<img src="./storage/<%=oldfile %>"
            class="img-rounded" width="200px" height="200px">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content">변경 Image</label>
				<div class="col-sm-6">
					<input type="file" name="fname" class="form-control"
					accept=".png, .jpg, .gif" required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">수정</button>
					<button type="reset" class="btn" onclick="history.back()">취소</button>
				</div>
			</div>


		</form>

	</div>
</body>
</html>
