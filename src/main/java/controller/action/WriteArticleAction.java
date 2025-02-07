package controller.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;
import model.dao.MemberDAO;
import model.domain.Article;
import model.domain.Member;

public class WriteArticleAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		try {
			if (title == null || title.trim().length() == 0 || title == null || content.trim().length() == 0
					|| content == null || content.trim().length() == 0) {
				throw new Exception("입력값이 충분하지 않습니다.");
			}

			Cookie[] cookies = request.getCookies();
			String id = null;
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("id")) {
						id = c.getValue();
						break;
					}
				}
			}

			Member member = MemberDAO.getMember(id);

			boolean result = ArticleDAO.writeArticle(member, new Article(title, content));

			if (result) {
				response.sendRedirect("article?command=list");
			} else {
				throw new Exception("입력값이 충분하지 않습니다.");
			}
		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
