package controller.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;
import model.domain.Article;


public class UpdateArticleAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String articleId = request.getParameter("article_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String id = null;
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				if(c.getName().equals("id")) {
					id = c.getValue();
					break;
				}
			}
		}
		
		try{
			Article article = ArticleDAO.getArticle(Long.parseLong(articleId));
			
			if(articleId == null || articleId.trim().length() == 0 ||
					title == null || title.trim().length() == 0 ||
					content == null || content.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			
			boolean result = ArticleDAO.updateArticle(title, content, article.getArticleId());
			
			if(result){
				response.sendRedirect("article?command=article_detail&article_id=" + articleId);
			}else{
				throw new Exception("게시물이 존재하지 않거나, 비밀번호가 올바르지 않습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("view/error.jsp").forward(request, response);
		}
	}
}
