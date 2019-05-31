<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>Img 게시글 등록</title>
<meta charset="utf-8">

<script type="text/javascript">
  function incheck(f) {
    if (f.title.value == '') {
      alert('제목을 입력해 주세요.')
      f.title.focus();
      return false;
    }

    if (f.content.value == '') {
      alert('내용을 입력해주세요.')
      f.content.focus();
      return false;
    }

    if (f.passwd.value == '') {
      alert('패스워드를 입력해주세요.')
      f.passwd.focus();
      return false;
    }
  }
</script>

<style>
#bbsg{
color:white;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10" id="bbsg">Img 등록</h1>
		<form class="form-horizontal" method="post" action="createProc.jsp"
			onsubmit="return incheck(this)" name="frm" enctype="multipart/form-data">

			<div class="form-group">
				<label class="control-label col-sm-2" for="fname" id="bbsg">사진</label>
				<div class="col-sm-8">
					<input type="file" accept=".jpg,.gif,.png" name="fname"
						id="fname" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="title" id="bbsg">제목</label>
				<div class="col-sm-6">
					<input type="text" name="title" id="title" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content" id="bbsg">내용</label>
				<div class="col-sm-6">
					<textarea rows="5" cols="5" id="content" name="content"
						class="form-control"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="name" id="bbsg">글쓴이</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name"
						class="form-control"></input>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd" id="bbsg">패스워드</label>
				<div class="col-sm-3">
					<input type="password" name="passwd" id="passwd"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
					<button type="button" class="btn"
						onclick="location.href='./list.jsp'">목록</button>
				</div>
			</div>


		</form>

	</div>
</body>
</html>
