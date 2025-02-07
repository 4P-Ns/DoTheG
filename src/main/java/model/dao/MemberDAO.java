package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.domain.Member;
import util.DataSourceManager;

public class MemberDAO {
	// id로 해당 멤버의 모든 정보 반환
	public static Member getMember(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;

		try {
			conn = DataSourceManager.getConnection();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				member = new Member(rset.getLong(1), 
									rset.getString(2), 
									rset.getString(3), 
									rset.getString(4),
									rset.getString(5), 
									rset.getString(6), 
									rset.getString(7), 
									rset.getString(8), 
									rset.getLong(9));
			}
		} finally {
			DataSourceManager.close(conn, pstmt, rset);
		}
		return member;
	}
}
