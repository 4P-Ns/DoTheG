package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.MemberDAO;

import java.io.IOException;



//http://localhost:8080/DoTheG/view/login.html
@WebServlet("/login")
public class LoginController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("***************");
		String inputId = request.getParameter("id");
		String inputPw = request.getParameter("pw");
		
		if (validateAccount(inputId, inputPw)) {
			Cookie userIdCookie = new Cookie("userId", inputId);
			Cookie userPwCookie = new Cookie("userPw", inputPw);
			userIdCookie.setMaxAge(60*60);
			userPwCookie.setMaxAge(60*60);
			userIdCookie.setPath("/");
			userPwCookie.setPath("/");
			
			response.addCookie(userIdCookie);
			response.addCookie(userPwCookie);
			
			request.getRequestDispatcher("view/main.jsp").forward(request, response);
		} else {
			System.out.println("test");
			request.setAttribute("errorMessage", "등록되지 않은 아이디 혹은 비밀번호입니다.");
            response.sendRedirect("view/login.html");
		}
		
		
	}
	
	private static boolean validateAccount(String inputId, String inputPw) {
		try {
			if (MemberDAO.isValidUserId(inputId)) {
				System.out.println("valid userId");
				return MemberDAO.isValidUserPw(inputId, inputPw);
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return false;
	}

}
