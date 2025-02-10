package controller.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogoutAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 쿠키 가져오기
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userId")) {
					cookie.setMaxAge(0); // 쿠키 즉시 만료 (삭제)
					cookie.setPath("/"); // 모든 경로에서 적용
					response.addCookie(cookie); // 클라이언트에 적용
				} else if (cookie.getName().equals("userPw")) {
					cookie.setMaxAge(0); // 쿠키 즉시 만료 (삭제)
					cookie.setPath("/"); // 모든 경로에서 적용
					response.addCookie(cookie); // 클라이언트에 적용
				}
			}
		}

		// 메인 페이지로 이동
		response.sendRedirect(request.getContextPath() + "/view/main.jsp");
	}

}
