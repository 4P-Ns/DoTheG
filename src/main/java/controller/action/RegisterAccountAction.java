package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.ArticleDAO;

public class RegisterAccountAction implements Action {
 
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String url = "error.jsp";
		
		try {
		    String username = request.getParameter("username");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    String country = request.getParameter("country");
		    
		    if(username == null || email == null || password == null || country == null || 
		       username.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty() || country.trim().isEmpty()) {
		        out.println("<script>alert('모든 필드를 입력해주세요.'); window.location='signup.jsp';</script>");
		        return;
		    }
		    int result = DAO.~~~;
		    if(result > 0) {
	            out.println("<script>alert('가입 완료! " + country + "로 떠나볼까요?'); window.location='signup.jsp';</script>");
	        } else {
	            out.println("<script>alert('가입에 실패했습니다. 다시 시도해주세요.'); window.location='signup.jsp';</script>");
	        }
		    
			request.setAttribute("articles", ArticleDAO.getAllArticles());
			url = "view/list.jsp";
		} catch (SQLException e) {
			request.setAttribute("errorMsg", "모든 게시글 검색시 문제 발생, 잠시후 재 시도 하세요");
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}


}
