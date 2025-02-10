package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;
import model.dao.MemberDAO;
import model.domain.Article;
import model.domain.Member;

public class ArticleDetailViewAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "view/error.jsp";
		String articleId = request.getParameter("article_id");
		try{
			if(articleId == null || articleId.length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			
			Article article = ArticleDAO.getArticle(Long.parseLong(articleId));
			
			if(article == null){
				throw new Exception("게시물이 존재하지 않습니다.");
			}else{
				Member member = MemberDAO.getMemberByPk(article.getAuthorId());
				String authorUserId = ArticleDAO.getAuthorUserId(article.getAuthorId());
				request.setAttribute("resultContent", article);
				request.setAttribute("author", member.getNickname());
				request.setAttribute("authorUserId", authorUserId);
				
				url = "view/read.jsp";
			}
		}catch (SQLException e) {
			request.setAttribute("errorMsg", "해당 개시글 검색시 이슈 발생, 잠시후 재요청 해 주세요");			
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
