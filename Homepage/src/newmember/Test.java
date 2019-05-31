package newmember;

import java.util.HashMap;
import java.util.Map;

public class Test {
	public static void main(String[] args) {
		NewMemberDAO dao = new NewMemberDAO();
		
		Map map = new HashMap();
		map.put("id", "user5");
		map.put("mname", "개발자5");
		
		String passwd = dao.passwdfind(map);
		
		System.out.println(passwd);
	}
}
