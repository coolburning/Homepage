package imgup;

import java.util.Iterator;
import java.util.List;

public class ImgUpTest {
	
	public static void main(String[] args) {
		ImgUpDAO dao = new ImgUpDAO();
		
		create(dao);
//		delete(dao);
//		list(dao);
	}

	private static void list(ImgUpDAO dao) {
		List<ImgUpDTO> list = dao.list(null);
		Iterator<ImgUpDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			ImgUpDTO dto = iter.next();
			p(dto);
			p("-------------------------");
		}
		
	}

	private static void p(ImgUpDTO dto) {
		System.out.println(" ");
		System.out.println("번호 : " + dto.getImgno());
		System.out.println("사진 : " + dto.getFname());
		System.out.println("이름 : " + dto.getName());
		System.out.println("제목 : " + dto.getTitle());
		System.out.println("조회수 : " + dto.getViewcnt());
		System.out.println("등록날짜 : " + dto.getRegdate());
	}

	private static void delete(ImgUpDAO dao) {
		if(dao.delete(1)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void create(ImgUpDAO dao) {
		ImgUpDTO dto = new ImgUpDTO();
		dto.setName("지나가는행인1");
		dto.setTitle("오늘의 날씨");
		dto.setContent("비올줄 알았는데 비가 안온다.");
		dto.setPasswd("1234");
		dto.setFname("./cat.jpg");
		
		if(dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void p(String string) {
		System.out.println(string);
	}
}
