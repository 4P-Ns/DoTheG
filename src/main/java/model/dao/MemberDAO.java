package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.domain.Member;
import util.DataSourceManager;

public class MemberDAO {
	
	public static boolean registerMember(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DataSourceManager.getConnection();
			pstmt = conn.prepareStatement(
					"INSERT INTO member VALUES (9997, ?, ?, ?, ?, ?, ?, null, null)");
			
//			private long memberId;
//			private String id;
//			private String pw;
//			private String name;
//			private String nickname;
//			private String email;
//			private String role;
//			private String profileImagePath;
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNickname());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getRole());

			if (pstmt.executeUpdate() != 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			DataSourceManager.close(conn, pstmt);
		}
		return false;
	}
	
	public static Member getMemberByPk(long memberId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		try {
			conn = DataSourceManager.getConnection();
			pstmt = conn.prepareStatement("select * from member where member_id=?");
			pstmt.setLong(1, memberId);
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
	
	// input으로 받은 id가 존재하는 id인지 확인하는 boolean method
	public static boolean isValidUserId(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			conn = DataSourceManager.getConnection();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			System.out.println("---------------");
			if (rset.next()) {
				return true;
			}
		} finally {
			DataSourceManager.close(conn, pstmt, rset);
		}
		return false;
	}
	
	// input으로 받은 pw가 해당 id에 일치하는 pw인지 확인하는 boolean method
		public static boolean isValidUserPw(String userId, String userPw) throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			try {
				conn = DataSourceManager.getConnection();
				pstmt = conn.prepareStatement("select * from member where id=? and pw=?");
				pstmt.setString(1, userId);
				pstmt.setString(2, userPw);
				rset = pstmt.executeQuery();
				if (rset.next()) {
					return true;
				}
			} finally {
				DataSourceManager.close(conn, pstmt, rset);
			}
			return false;
		}
}
