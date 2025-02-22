package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.Article;
import model.domain.Member;
import util.DataSourceManager;

public class ArticleDAO {

	//create
	public static boolean writeArticle(Member member, Article article) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DataSourceManager.getConnection();

			String sql = "INSERT INTO article (article_id, member_id, title, content, createdat, updatedat, family_id, task_done) " +
//                    "VALUES (seq_article_article_id.nextval, ?, ?, ?, sysdate, sysdate, ?, ?)";
						"VALUES (9999, ?, ?, ?, sysdate, sysdate, ?, ?)";

			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, member.getMemberId()); // authorId는 숫자 ID여야 함
	        pstmt.setString(2, article.getTitle());
	        pstmt.setString(3, article.getContent());
	        pstmt.setLong(4, member.getFamilyId());
	        pstmt.setBoolean(5, article.isTaskDone()); // boolean 값 추가

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
	
	//read
	public static Article getArticle(long articleId) throws SQLException{		
		Connection conn = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Article article  = null;
		
		try {
			conn = DataSourceManager.getConnection();
			
			pstmt = conn.prepareStatement("SELECT member_id, title, content, createdat, updatedat, family_id, task_done from article WHERE article_id=?");
			pstmt.setLong(1, articleId);	
			rset = pstmt.executeQuery();
			
			/* replaceAll("\n","<br/>")
			 * - 문자열의 모든 \n을 <br /> 변환해주는 메소드
			 * - 필요성
			 * 	- 브라우저에선 <br> tag가 new line
			 *  - 순수 문자열의 \n 개행을 의미하는 특수 기호
			 *  - 브라우저에 new line입력할 경우 db에도 \n과 같은 형식으로 저장
			 *  - 실제 브라우저에 출력시에는 new line (\n) -> <br /> 변환해서 출력			 * 
			 */
			if(rset.next()){
				article = new Article(articleId, rset.getLong(1),
										rset.getString(2),
										rset.getString(3).replaceAll("\n","<br>"),
										rset.getDate(4),
										rset.getDate(5), 
										rset.getLong(6), 
										rset.getBoolean(7));
			}
		}catch (SQLException e){
			e.printStackTrace();
			throw e;
		}finally{
			DataSourceManager.close(conn, pstmt, rset);
		}
		return article;
	}
	
	//read all
	public static ArrayList<Article> getAllArticles() throws SQLException{		
		Connection conn = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Article> articles  = null;
		
		try {
			conn = DataSourceManager.getConnection();
			
			pstmt = conn.prepareStatement("SELECT article_id, member_id, title, content, createdat, updatedat, family_id, task_done from article");
			rset = pstmt.executeQuery();
			
			articles = new ArrayList<>();
			while (rset.next()){
				articles.add(new Article(rset.getLong(1),
										rset.getLong(2),
										rset.getString(3),
										rset.getString(4).replaceAll("\n","<br>"),
										rset.getDate(5),
										rset.getDate(6), 
										rset.getLong(7), 
										rset.getBoolean(8)));
			}
		}catch (SQLException e){
			e.printStackTrace();
			throw e;
		}finally{
			DataSourceManager.close(conn, pstmt, rset);
		}
		
		return articles;
	}
	
	public static String getAuthorUserId(long authorId) throws SQLException{
		Connection conn = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String authorUserId  = null;
		
		try {
			conn = DataSourceManager.getConnection();
			
			pstmt = conn.prepareStatement("SELECT m.id FROM member m INNER JOIN article a ON m.member_id = a.member_id WHERE a.member_id = ?");
			pstmt.setLong(1, authorId);
			rset = pstmt.executeQuery();
			
			if (rset.next()){
				authorUserId = rset.getString(1);
			}
		}catch (SQLException e){
			e.printStackTrace();
			throw e;
		}finally{
			DataSourceManager.close(conn, pstmt, rset);
		}
		
		return authorUserId;
	}
	
	//update
	public static boolean updateArticle(String title, String content, long articleId) throws SQLException{
		Connection conn = null;	
		PreparedStatement pstmt = null;
		
		try {
			conn = DataSourceManager.getConnection();
			pstmt = conn.prepareStatement("UPDATE article set title=?, content=?, updatedat=sysdate WHERE article_id=?");

			pstmt.setString(1, title);
		    pstmt.setString(2, content);
		    pstmt.setLong(3, articleId);
		    
			int count = pstmt.executeUpdate();
			
			if(count != 0){
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
	
	//delete
	public static boolean deleteArticle(long articleId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DataSourceManager.getConnection(); 
			
			pstmt = conn.prepareStatement("delete from article where article_id=?"); 
			pstmt.setLong(1, articleId); 
			int result = pstmt.executeUpdate(); 
			if(result != 0) {
				return true;
			}
		} finally {
			DataSourceManager.close(conn, pstmt);
		}
		
		return false;
	}

}
