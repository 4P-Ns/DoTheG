package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.domain.Article;
import model.domain.Member;
import util.DataSourceManager;

public class ArticleDAO {
	
	/* 결과가
	 * 1. 정상
	 * 	- 정상 저장
	 * 2. 비정상
	 * 	- SQLExcption 발생 
	 */
	public static boolean writeContent(Member member, Article article) throws SQLException{
		Connection conn = null;	
		PreparedStatement pstmt = null;

		try {
			
			conn = DataSourceManager.getConnection();
			
			pstmt = conn.prepareStatement("INSERT INTO gbook VALUES (seq_article_article_id.nextval, ?, ?, ?, ?, sysdate, sysdate)");
	       
			pstmt.setString(1, member.getNickname());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.setLong(4, member.getFamilyId());
		
	        
			if(pstmt.executeUpdate() != 0) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}finally{
			DataSourceManager.close(conn, pstmt);
		}
		
		return false;
	}

}
