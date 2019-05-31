<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi_newguestbook.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
<title>방명록 작성</title>
<meta charset="utf-8">

<style type="text/css">

#bbsg{
color:white;
}

body  {
  background-color:block;
  background-repeat: repeat-y;
}

#need{
color:red;
}
</style>

<script type="text/javascript">
function incheck(f){
if(f.title.value ==''){
alert('제목을 작성해주세요.')
f.title.focus();
return false;
}

if(f.content.value==''){
alert('내용을 입력헤주세요.')
f.content.focus();
return false;
}

if(f.content.value==''){
alrert('날짜 선택해주세요.')
f.regdate.focus();
return false;
}


if(f.gender[0].checked==false && f.gender[1].checked==false){
alert('성별을 체크해주세요.')
f.gender[0].focus();
return false;
}

var check=0;
for(var i=0; i<f.part.length; i++){
if(f.part[i].checked){
check++;
}
}

}

</script>
</head>
<body>

  <jsp:include page="/Menu/top.jsp" />

<div class="container">
<h2 class="col-sm-offset-4 col-sm-8" id="bbsg">방명록 작성</h2>
<form class="form-horizontal" method="post" action=createProc.jsp onsubmit="return incheck(this)">
  
  
  <div class="col-sm-offset-2 col-sm-10">
  <br>
  <span id="need">*</span><span id="bbsg"> 값은 필수로 입력해주세요.</span>
  
  </div>
  
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="title" id="bbsg">제목<span id="need">*</span></label>
    <div class="col-sm-10">
    <input type="text" id="title" name="title" class="form-control"
    style=background-color:#E6E6E6 placeholder="제목을 입력해주세요.">
    </div>
  </div>


  <div class="form-group">
    <label class="control-label col-sm-2" for="content" id="bbsg">내용<span id="need">*</span></label>
    <div class="col-sm-10">
    <textarea rows="10" cols="8" id="content" name="content" class="form-control"
    placeholder="내용을 입력해주세요." style=background-color:#E6E6E6></textarea>
    </div>
  </div>


  <div class="form-group">
    <label class="control-label col-sm-2" for="name" id="bbsg">성함<span id="need">*</span></label>
    <div class="col-sm-10">
    <input type="text" id="name" name="name" class="form-control" placeholder="NAME"
    style=background-color:#E6E6E6>
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="part" id="bbsg">선호분야<span id="need">*</span></label>
    <div class="col-sm-10">
    
      <label class="checkbox-inline">
       <input type="checkbox" name="part" value="소통">소통
      </label>
      <label class="checkbox-inline">
       <input type="checkbox" name="part" value="사진">사진
      </label>
      <label class="checkbox-inline">
       <input type="checkbox" name="part" value="스터디">스터디
      </label>
      <label class="checkbox-inline">
       <input type="checkbox" name="part" value="뉴스">뉴스
      </label>
      <label class="checkbox-inline">
       <input type="checkbox" name="part" value="음악">음악
      </label>
      <label class="checkbox-inline">
       <input type="checkbox" name="part" value="영화">영화
      </label>
    
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="gender" id="bbsg">성별<span id="need">*</span></label>
    <div class="col-sm-10">
      <label class="radio-inline">
        <input type="radio" name="gender" value="남자" id="bbsg">남자
      </label>
      <label class="radio-inline">
        <input type="radio" name="gender" value="여자" id="bbsg">여자
      </label>
    </div>
  </div>




  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
      <button class="btn" >등록</button>
      <button type="reset" class="btn">취소</button>
      <button type="button" class="btn" onclick="location.href='./list.jsp'">목록</button>
    </div>
  </div>

</form>



</div>
</body> 
</html>