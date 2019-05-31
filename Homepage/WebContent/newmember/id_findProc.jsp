<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>
<%
String name = request.getParameter("mname");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("name", name);
map.put("email", email);

System.out.println("성함 : " + name);
System.out.println("이메일 : " + email);
String id = dao.idfind(map);

		if(id!=null){
			out.print(name + "님의 아이디를 찾았습니다. : " + id);
		} else {
			out.print(name + "님의 아이디를 못찾았습니다.");
			out.print(" 이메일 또는 성함을 다시 한번 더 확인 부탁드립니다.");
		}
%>
