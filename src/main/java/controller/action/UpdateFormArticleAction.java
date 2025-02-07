package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;
import model.domain.Article;

public class UpdateFormArticleAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "view/error.jsp";
		//<input type="hidden" name="num" value="${requestScope.resultContent.num}">
		String articleId = request.getParameter("article_id");
		
		try{
			// || 두 조건중 하나만 true인 경우 true
			if(articleId == null || articleId.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			
			/* 하나의 게시글 검색 시점은 두가지
			 * 1. 단순 검색
			 * 	- select
			 * 	- 조회수 업데이트 필수 (+1)
			 * 2. 검색이 아닌 수정
			 * 	- select 
			 * 	- 조회수 업데이트 거부 
			 */
			
			// 반환값은 null or GuestBookBean 객체
			Article article = ArticleDAO.getArticle(Long.parseLong(articleId));
			
			if(article == null){
				throw new Exception("해당 게시물이 존재하지 않아 수정 불가입니다.");
			}else{
				article.setContent(article.getContent().replaceAll("<br/>", "\n"));//???
//				gContent.setContent(gContent.getContent());//?
				
				request.setAttribute("resultContent", article);
				url = "view/update.jsp";
			}
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
