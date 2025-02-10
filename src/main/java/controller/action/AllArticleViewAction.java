package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;
import model.dao.MemberDAO;
import model.domain.Article;
import model.dto.ArticleDTO;

public class AllArticleViewAction implements Action {
 
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "view/error.jsp";
		
		try {
			ArrayList<ArticleDTO> articleList = new ArrayList<>();
			ArrayList<Article> articles = ArticleDAO.getAllArticles();
			
			for(Article a:articles) {
				String authorName = MemberDAO.getMemberByPk(a.getAuthorId()).getNickname();
				articleList.add(new ArticleDTO(a,authorName));
			}
			
			request.setAttribute("articles", articleList);
			url = "view/list.jsp";
		} catch (SQLException e) {
			request.setAttribute("errorMsg", "모든 게시글 검색시 문제 발생, 잠시후 재 시도 하세요");
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}


}
