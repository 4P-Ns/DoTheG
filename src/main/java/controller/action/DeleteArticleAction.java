package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;

public class DeleteArticleAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String articleId = request.getParameter("article_id");
		String authorId = request.getParameter("author_id");
		
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
			if(articleId == null || articleId.trim().length() == 0 || id == null || id.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			
			boolean result = ArticleDAO.deleteArticle(Long.parseLong(articleId),Long.parseLong(authorId));

			if(result){
				response.sendRedirect("board?command=list");
			}else{
				throw new Exception("이미 삭제된 게시물이거나, 비밀번호가 올바르지 않습니다.");
			}
		}catch (SQLException e) {
			request.setAttribute("errorMsg", "시스템 문제가 발생했습니다.");
			request.getRequestDispatcher("view/error.jsp").forward(request, response);
		}catch (Exception e){
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("view/error.jsp").forward(request, response);
		}
	}
	
}
