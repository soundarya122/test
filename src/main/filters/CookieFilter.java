package main.filters;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.beans.UserAccount;
import main.conn.ConnectionUtils;
import main.conn.MyUtils;
import utils.DBUtils;

@WebFilter(filterName="cookieFilter", urlPatterns= {"/*"})
public class CookieFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
//		System.out.println("---- COOKIE FILTER.... >> "+ req.getServletPath());
		HttpSession session = req.getSession();
		
		UserAccount user = MyUtils.retrieveUser(session);
		if(user != null) {
			session.setAttribute(MyUtils.CookieChecked, "checked");
			chain.doFilter(request, response);
			return;
		}
		
		Connection conn = MyUtils.retrieveConnection(request);
		String checked = (String) session.getAttribute(MyUtils.CookieChecked);
		if(checked==null && conn != null) {
			String username = MyUtils.retrieveUserCookie(req);
			try {
				UserAccount availUser = DBUtils.findUser(conn, username);
				MyUtils.storeUser(session, availUser);
			}catch(Exception e) {
				e.printStackTrace();
			}
			session.setAttribute(MyUtils.CookieChecked, "checked");
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
