package main.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.beans.UserAccount;

@WebFilter(filterName = "cookieFilter", urlPatterns = { "/*" })
public class CookieFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
//		System.out.println("---- 1) COOKIE FILTER.... >> " + req.getServletPath());
		String Uri = req.getServletPath();
		HttpSession session = req.getSession(false);

		if(Uri.equals("/login")) {
			chain.doFilter(request, response);
			return;
		}
		if(session != null) {
			UserAccount user = (UserAccount)session.getAttribute("user");
			if (user == null) {
				RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
				dispatcher.include(request, response);
				return;
			}
		}else {
			RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
			dispatcher.include(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
