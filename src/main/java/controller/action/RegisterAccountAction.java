package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.MemberDAO;
import model.domain.Member;

public class RegisterAccountAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String url = "view/error.jsp";
		
		try {
		    String id = request.getParameter("id"); 
		    String password = request.getParameter("password");
		    String username = request.getParameter("username");
		    String nickname = request.getParameter("nickname");
		    String email = request.getParameter("email");
		    String role = request.getParameter("role");
		    
		    if(id == null || password == null || username == null || nickname == null || email == null || role == null||
		       id.trim().isEmpty() || password.trim().isEmpty() || username.trim().isEmpty() || nickname.trim().isEmpty() || email.trim().isEmpty() || role.trim().isEmpty()) {
		        out.println("<script>alert('모든 필드를 입력해주세요.'); window.location='view/signup.html';</script>");
		        return;
		    }
		    
		    boolean result = MemberDAO.registerMember(new Member(id, password, username, nickname, email, role));
		    
		    if(result) {
	            out.println("<script>alert('가입 완료! " + nickname + "님 환영합니다~~!!'); window.location.href='view/main.html';</script>");
	        } else {
	            out.println("<script>alert('가입에 실패했습니다. 다시 시도해주세요.'); window.location='view/signup.html';</script>");
	        }
		    
			url = "view/main.html";
			
		} catch (SQLException e) {
			request.setAttribute("errorMsg", "모든 게시글 검색시 문제 발생, 잠시후 재 시도 하세요");
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

		
}
