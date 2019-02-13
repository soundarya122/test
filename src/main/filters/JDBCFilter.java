package main.filters;

import java.io.IOException;
import java.sql.Connection;
import java.util.Collection;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.beans.UserAccount;
import main.conn.ConnectionUtils;

@WebFilter(filterName = "jdbcFilter", urlPatterns = { "/*" })
public class JDBCFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
//        System.out.println("----2) jdbcFilter FILTER.... >> " + request.getServletPath());
        
        String servletPath = request.getServletPath();
        
        String lang = request.getParameter("lang");
		if(lang == null)
			lang = "en";
		ResourceBundle rb = ResourceBundle.getBundle("app", new Locale(lang));
		HttpSession sess = request.getSession(false);
		if(sess != null) {
			if(sess.getAttribute("rb") == null) {
				sess.setAttribute("rb", rb);
			}
		}
        chain.doFilter(request, response);
	}

	private boolean needJDBC(HttpServletRequest request) {
		String urlPattern = request.getServletPath();
		Map<String, ? extends ServletRegistration> servlets = request.getServletContext().getServletRegistrations();
		Collection<? extends ServletRegistration> values = servlets.values();
		for (ServletRegistration sr : values) {
			Collection<String> mappings = sr.getMappings();
			if (mappings.contains(urlPattern)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
