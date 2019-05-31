package newguestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class NewGuestbookDAO {
	
	
	public boolean createReply(NewGuestbookDTO dto) {

		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into newguestbook ");
		sql.append(" (no, name, gender, title, content, regdate, part, grpno, indent, ansnum) ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(no), 0)+1 from newguestbook), ");
		sql.append(" ?, ?, ?, ?, ");
		sql.append(" sysdate, ?, ?, ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPartstr());
			pstmt.setInt(6, dto.getGrpno());
			pstmt.setInt(7, dto.getIndent()+1);
			pstmt.setInt(8, dto.getAnsnum()+1);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(pstmt, con);
		}
		return flag;
	}

	public void upAnsnum(Map map) {
		// 부모 밑으로 자식 게시글을 넣어주기 위한게 upAnsnum
		// 다음 자식글이 들어오면 처음 자식글을 아래로 내리고 부모글 바로 아래 새로운 자식글을 넣어준다.
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update newguestbook set ansnum = ansnum +1 where grpno=? ");
		sql.append(" and ansnum > ? ");
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(pstmt, con);
		}
	}

	public NewGuestbookDTO readReply(int no) {
		
		NewGuestbookDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select no, grpno, name, gender, title, content, regdate, part ");
		sql.append(" from newguestbook where no=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new NewGuestbookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPartstr(rs.getString("part"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.Close(rs, pstmt, con);
		}
		return dto;

	}

	public static String pp(NewGuestbookDTO dto) {
		StringBuffer temp = new StringBuffer();

		temp.append("번호 : " + dto.getNo() + "<br>");
		temp.append("이름 : " + dto.getName() + "<br>");
		temp.append("성별 : " + dto.getGender() + "<br>");
		temp.append("제목 : " + dto.getTitle() + "<br>");
		temp.append("내용 : " + dto.getContent() + "<br>");
		temp.append("분야 : " + dto.getPartstr() + "<br>");

		String str = temp.toString();
		return str;
	}

	public boolean create(NewGuestbookDTO dto) {

		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into newguestbook ");
		sql.append(" (no, name, gender, title, content, regdate, part, grpno) ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(no), 0)+1 from newguestbook), ");
		sql.append(" ?, ?, ?, ?, ");
		sql.append(" sysdate, ?, ");
		sql.append(" (select nvl(max(grpno), 0)+1 from newguestbook)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPartstr());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(pstmt, con);
		}
		return flag;
	}

	public boolean delete(int no) {

		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from ");
		sql.append(" newguestbook where no=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			int cnt = pstmt.executeUpdate();
			
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(pstmt, con);
		}
		return flag;
	}

	public boolean update(NewGuestbookDTO dto) {

		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update newguestbook set ");
		sql.append(" title=?, ");
		sql.append(" content=?, ");
		sql.append(" name=?, ");
		sql.append(" part=?, ");
		sql.append(" gender=? ");
		sql.append(" where no=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPartstr());
			pstmt.setString(5, dto.getGender());
			pstmt.setInt(6, dto.getNo());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(pstmt, con);
		}
		return flag;
	}

	public NewGuestbookDTO read(int no) {

		NewGuestbookDTO dto = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select no, name, gender, title, content, regdate, part ");
		sql.append(" from newguestbook where no=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new NewGuestbookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPartstr(rs.getString("part"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.Close(rs, pstmt, con);
		}
		return dto;

	}

	public int total(Map map) {
		int total=0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) from newguestbook ");
		
		if (word.trim().length() > 0)
			sql.append(" 	 where " + col + " like '%'||?||'%' ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if (word.trim().length() > 0) 
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(rs, pstmt, con);
		}
		return total;
	}
	
	public List<NewGuestbookDTO> list(Map map) {
		List<NewGuestbookDTO> list = new ArrayList<NewGuestbookDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		

		StringBuffer sql = new StringBuffer();
		
		sql.append(" select no, title, name, part, regdate, grpno, indent, ansnum, r ");
		sql.append(" from( ");
		
		sql.append(" 	 select no, title, name, part, regdate, grpno, indent, ansnum, rownum r ");
		sql.append(" 	 from( ");
		
		sql.append("		 select no, title, name, part, regdate, grpno, indent, ansnum ");
		sql.append(" 		 from newguestbook ");

		if (word.trim().length() > 0) 
			sql.append(" 	 where " + col + " like '%'||?||'%' ");
		
		
		sql.append(" 		 order by grpno desc, ansnum asc ");
		
		sql.append("	 ) ");
		sql.append(" )where r >= ? and r <= ? ");
		
		try {
			
			int i = 0;
			
			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0) 
				pstmt.setString(++i, word);

				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NewGuestbookDTO dto = new NewGuestbookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setPartstr(rs.getString("part"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.Close(rs, pstmt, con);
		}
		return list;
	}

}
