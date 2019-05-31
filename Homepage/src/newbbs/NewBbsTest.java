package newbbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class NewBbsTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		NewBbsDAO dao = new NewBbsDAO();
		
		//list(dao);
		//passCheck(dao);
		create(dao);
		//update(dao);
//		delete(dao);
	}

	private static void delete(NewBbsDAO dao) {
		// TODO Auto-generated method stub
		if(dao.delete(1)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void update(NewBbsDAO dao) {
		NewBbsDTO dto = dao.read(1);
		dto.setWname("변경자");
		dto.setTitle("제목변경");
		dto.setContent("내용변경");
		// TODO Auto-generated method stub
		if(dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void create(NewBbsDAO dao) {
		// TODO Auto-generated method stub
		NewBbsDTO dto = new NewBbsDTO();
		dto.setWname("아로미");
		dto.setTitle("게시판 실습");
		dto.setContent("게시판 답변");
		dto.setPasswd("1234");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
		
		if(dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.print(string);
	}

	private static void passCheck(NewBbsDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", "1234");
		if(dao.passCheck(map )) {
			p("올바른 패스워드 입니다.");
		}else {
			p("잘못된 패스워드 입니다.");
		}
		
	}

	private static void list(NewBbsDAO dao) {
		// TODO Auto-generated method stub
		List<NewBbsDTO> list = dao.list(null);
		Iterator<NewBbsDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			NewBbsDTO dto = iter.next();
			p(dto);
			p("-----------------");
		}
	}

	private static void p(NewBbsDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(" ");
		System.out.println("번호 : " + dto.getBbsno());
		System.out.println("이름 : " + dto.getWname());
		System.out.println("제목 : " + dto.getTitle());
		System.out.println("내용 : " + dto.getContent());
		System.out.println("조회수 : " + dto.getViewcnt());
		System.out.println("등록날짜 : " + dto.getWdate());
		System.out.println("grpno : " + dto.getGrpno());
		System.out.println("indent : " + dto.getIndent());
		System.out.println("ansnum : " + dto.getAnsnum());
		
		
	}

}
