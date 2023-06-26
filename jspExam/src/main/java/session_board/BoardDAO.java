package session_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	private Connection con;
	
	public BoardDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int boardCount() {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT count(TO_NUMBER(no)) FROM session_board";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<BoardDTO> getBoardPage(int begin, int end) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT BBB.* FROM"
				+ "(SELECT rownum as rn, AAA.* FROM (SELECT session_board.* FROM session_board  ORDER BY TO_NUMBER(no) DESC) AAA)BBB"
				+ " WHERE BBB.rn >= ? AND BBB.rn <= ?";
		ArrayList<BoardDTO> boards = new ArrayList<>();
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO boardDto = new BoardDTO();
				
				boardDto.setNo(rs.getString("no"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setId(rs.getString("id"));
				boardDto.setWriteDate(rs.getString("write_date"));
				boardDto.setHits(rs.getString("hits"));
				boardDto.setFileName(rs.getString("file_name"));
				
				boards.add(boardDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boards;
	}
	
	public int selectMaxNo() {
		int no = 0;
		String sql = "SELECT max(TO_NUMBER(no))+1 FROM session_board";
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return no;
	}
	
	public void write(BoardDTO board) {
		String sql = "INSERT INTO session_board VALUES(?,?,?,?,?,?,?)";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getNo());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getId());
			ps.setString(5, board.getWriteDate());
			ps.setString(6, board.getHits());
			ps.setString(7, board.getFileName());
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public BoardDTO selectNo(String num) { // 글 상세 페이지.
		String sql = "SELECT * FROM session_board WHERE no = ?";
		
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				BoardDTO boardDto = new BoardDTO();
							
				boardDto.setNo(rs.getString("no"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setId(rs.getString("id"));
				boardDto.setWriteDate(rs.getString("write_date"));
				boardDto.setHits(rs.getString("hits"));
				boardDto.setFileName(rs.getString("file_name"));
				return boardDto; 
			}
		} catch (SQLException e) {
		}
		return null;
	}
	
	public void updateHits(String num) { // 글 클릭시 조회수 증가.
		String sql = "UPDATE session_board SET hits=? WHERE no = ?";
		BoardDTO selected = selectNo(num);
		int plusHit = Integer.parseInt(selected.getHits())+1;
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, Integer.toString(plusHit));
			ps.setString(2, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateContent(String num, String title, String content) { // 글 클릭시 조회수 증가.
		String sql = "UPDATE session_board SET title=?, content=? WHERE no=?";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String num) {
		String sql = "DELETE FROM session_board WHERE no=?";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
