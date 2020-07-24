package poly.intercepsor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerIntercepsor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
			response.sendRedirect(request.getContextPath()+"/login/submit.htm");
			session.setAttribute("message", "Login is required");
			return false;
		}
		return true;
	}
	
}
