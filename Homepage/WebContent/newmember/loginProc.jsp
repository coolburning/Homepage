<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

Map map = new HashMap();
map.put("id", id);
map.put("pw", passwd);

boolean flag = dao.loginCheck(map);

String grade = null; // 회원등급에 저장할 변수

if(flag){
	grade = dao.getGrade(id);
	session.setAttribute("id", id);
	session.setAttribute("grade", grade);
	
	//---------------------------------------
  // Cookie 저장, Checkbox는 선택하지 않으면 null 임
	//---------------------------------------
	Cookie cookie = null;
	
	String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부
	
	if(c_id !=null){ // 처음에는 값이 없음으로 null 체크로 처리
		cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키
		cookie.setMaxAge(120); // 2분 유지
		response.addCookie(cookie); // 쿠키 기록
		
		cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키
		cookie.setMaxAge(120); // 2분 유지
		response.addCookie(cookie); // 쿠키 기록
	} else {
		cookie = new Cookie("c_id", ""); // 쿠키 삭제
	  cookie.setMaxAge(0);
	  response.addCookie(cookie);
	  
	  cookie = new Cookie("c_id_val", ""); // 쿠키 삭제
	  cookie.setMaxAge(0);
	  response.addCookie(cookie);
	}
	//---------------------------------------
}
%>


<!DOCTYPE html>
<html>
<head>
<title>Login 처리 확인</title>
<meta charset="utf-8">
</head>
<body>

	<jsp:include page="/Menu/top.jsp" />

	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">Login 처리</h1>
		<div class="well well-lg">
		<%
		if(flag){
			out.print("로그인이 되었습니다.");
		} else {
			out.print("아이디 또는 비밀번호를 잘못 입력하셨거나,<br>");
			out.print("회원이 아닙니다. 회원가입을 진행해주세요.");
		}
		%>
		</div>
		<button class="btn" onclick="location.href='../index.jsp'">홈</button>
		<button class="btn" onclick="history.back()">다시시도</button>

	</div>
</body>
</html>
