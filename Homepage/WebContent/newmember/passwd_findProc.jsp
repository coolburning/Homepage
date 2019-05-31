<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_newmember.jsp" %>
<jsp:useBean id="dao" class="newmember.NewMemberDAO"/>

<%
String id = request.getParameter("id");
String name = request.getParameter("mname");

Map map = new HashMap();
map.put("id", id);
map.put("name", name);

System.out.println("아이디 : " + id);
System.out.println("성함 : " + name);
String passwd = dao.passwdfind(map);


		if(passwd != null){
			out.print(name + "님의 비밀번호를 찾았습니다. : " + passwd);
		} else {
			out.print(name + "님의 비밀번호를 못찾았습니다.");
			out.print(" ID, 성함을 다시 한번 더 확인 부탁드립니다.");
		}
%>
