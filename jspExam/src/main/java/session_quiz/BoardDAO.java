package session_quiz;

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
	public int boardCount() {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT count(no) FROM session_board";
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
		String sql = "SELECT BBB.* "
				+ "FROM (SELECT rownum as rn, AAA.* "
				+ "FROM (SELECT session_board.* "
				+ "FROM session_board  ORDER BY TO_NUMBER(no))AAA)BBB WHERE BBB.rn >= ? AND BBB.rn <= ?";
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
}
