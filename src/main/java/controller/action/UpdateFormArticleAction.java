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
		String articleId = request.getParameter("article_id");
		
		try{
			if(articleId == null || articleId.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			
			Article article = ArticleDAO.getArticle(Long.parseLong(articleId));
			
			if(article == null){
				throw new Exception("해당 게시물이 존재하지 않아 수정 불가입니다.");
			}else{
				article.setContent(article.getContent().replaceAll("<br/>", "\n"));//???
				
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
