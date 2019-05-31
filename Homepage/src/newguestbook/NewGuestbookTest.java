package newguestbook;

public class NewGuestbookTest {

	public static void main(String[] args) {
		NewGuestbookDAO dao = new NewGuestbookDAO();
		
		update(dao);
	}

	private static void update(NewGuestbookDAO dao) {
		NewGuestbookDTO dto = dao.read(7);
		dto.setTitle("제목 dd22");
		dto.setContent("내용 변경");
		dto.setName("성함 변경");
		dto.setPartstr("사진");
		dto.setGender("여자");
		
		if(dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}
	
	private static void p(String string) {
		System.out.println(string);
		
	}
}
