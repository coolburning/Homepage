<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<!-- jquery ajax에 필요한 부분 start -->
<script type="text/javascript"
src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js" ></script>
<script src="<%=request.getContextPath() %>/js/ajaxssetup.js"></script>
<!-- jquery ajax에 필요한 부분 end -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
new daum.Postcode({
oncomplete: function(data) {
var addr = '';
var extraAddr = '';
if (data.userSelectedType === 'R') {
addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
document.getElementById("sample6_detailAddress").focus();
}
}).open();
}
</script>

<style type="text/css">
#need{
color:red;
}
</style>

<script type="text/javascript">
function idCheck(id){
if(id==""){
alert("아이디를 입력 해주세요.");
document.frm.id.focus();
}else{
var url = "idProc.jsp";
var param = "id="+id;
 
 $.get(
    url,
    param,
    function(data, textStatus) { // 응답 함수
    $("#idcheck").text(data);
    }
    );
}
}

function emailCheck(email){
if(email==""){
alert("이메일을 입력 해주세요.");
document.frm.email.focus();
}else{
var url = "emailProc.jsp";
var param = "email="+email;
 
 $.get(
    url,
    param,
    function(data, textStatus) { // 응답 함수
    $("#emailcheck").text(data);
    }
    );
}
}
</script>

<script type="text/javascript">
function incheck(f){

if(f.id.value==""){
alert("아이디를 입력하세요.");
f.id.focus();
return false;
}

if(f.passwd.value==""){
alert("패스워드를 입력하세요.");
f.passwd.focus();
return false;
}

if(f.repasswd.value==""){
alert("패스워드 확인를 입력하세요.");
f.repasswd.focus();
return false;
}

if(f.passwd.value!=f.repasswd.value){
alert("비밀번호가 일치하지 않습니다. 입력해 주세요");
f.passwd.focus();
return false;
}

if(f.mname.value==""){
alert("성함을 입력하세요.");
f.mname.focus();
return false;
}

if(f.tel.value==""){
alert("연락처를 입력하세요.");
f.tel.focus();
return false;
}

if(f.email.value==""){
alert("이메일을 입력하세요.");
f.email.focus();
return false;
}

if(f.job.selectedIndex==0){
alert("직업을 선택하세요.");
f.job.focus();
return false;
}

}
</script>

<style type="text/css">
#bbsg{
color:white;
}
</style>

</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10" id="bbsg">회원가입</h1>
		<label class="col-sm-offset-2 col-sm-10"><span id="bbsg">( <span id="need">*</span>는 필수 입력사항 입니다. )</span></label>
		<form class="form-horizontal" method="post" action="createProc.jsp" name="frm"
		onsubmit="return incheck(this)" enctype="multipart/form-data">
<!-- action="prcreateProc.jsp" : 아이디 중복 확인한다. -->


			<div class="form-group">
				<label class="control-label col-sm-2" for="fname" id="bbsg">사진</label>
				<div class="col-sm-8">
					<input type="file" accept=".jpg, .gif, .png" name="fname" id="fname" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="id">
				<span id="bbsg"><span id="need">*</span>아이디</span></label>
				<div class="col-sm-3">
					<input type="text" name="id" id="id" class="form-control">
				</div>
					<button type="button" class="btn col-sm-2"
					onclick="idCheck(document.frm.id.value)">ID중복확인</button>
					<div id="idcheck"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">
				<span id="bbsg"><span id="need">*</span>패스워드</span></label>
				<div class="col-sm-4">
					<input type="password" name="passwd" id="passwd" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd">
				<span id="bbsg"><span id="need">*</span>패스워드 확인</span></label>
				<div class="col-sm-4">
					<input type="password" name="repasswd" id="repasswd" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">
				<span id="bbsg"><span id="need">*</span>성함</span></label>
				<div class="col-sm-3">
					<input type="text" name="mname" id="mname" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="tel">
				<span id="bbsg"><span id="need">*</span>연락처</span></label>
				<div class="col-sm-3">
					<input type="text" name="tel" id="tel" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="email">
				<span id="bbsg"><span id="need">*</span>E-mail</span></label>
				<div class="col-sm-3">
					<input type="email" name="email" id="email" class="form-control">
				</div>
				<button type="button" class="btn col-sm-2" onclick="emailCheck(document.frm.email.value)"
				>Email 중복확인</button>
				<div id="emailcheck"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode"
				id="bbsg">우편번호</label>
				<div class="col-sm-2">
					<input type="text" name="zipcode" id="sample6_postcode" class="form-control">
				</div>
				<button class="btn col-sm-2" type="button" onclick="sample6_execDaumPostcode()"
				>주소검색</button>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address" id="bbsg">주소</label>
				<div class="col-sm-6">
					<input type="text" name="address1" id="sample6_address" class="form-control">
					<input type="text" name="address2" id="sample6_detailAddress" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="job">
				<span id="bbsg"><span id="need">*</span>직업</span></label>
				<div class="col-sm-2">
				<select name="job" class="form-control">
       <option value="0">선택하세요</option>
       <option value="A01">회사원</option>
       <option value="A02">전산관련직</option>
       <option value="A03">연구전문직</option>
       <option value="A04">각종학교학생</option>
       <option value="A05">일반자영업</option>
       <option value="A06">공무원</option>
       <option value="A07">의료인</option>
       <option value="A08">법조인</option>
       <option value="A09">종교/언론/예술인</option>
       <option value="A10">기타</option>      
      </select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
				</div> 
			</div>


		</form>

	</div>
</body>
</html>
