package main.filters;

import java.io.IOException;
import java.sql.Connection;
import java.util.Collection;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import main.conn.ConnectionUtils;
import main.conn.MyUtils;

@WebFilter(filterName = "jdbcFilter", urlPatterns = { "/*" })
public class JDBCFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest)request;
		Connection conn = null;
		boolean filterRequired = needJDBC(req);
//		System.out.println("---- JDBC FILTER.... >> "+ req.getServletPath()+" ..dbcheck required: "+ filterRequired);
		if(filterRequired) {
			try {
				conn = ConnectionUtils.getConnection();
				conn.setAutoCommit(false);
	
				MyUtils.storeConnection(request, conn);
				chain.doFilter(request, response);
				conn.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionUtils.closeQuietly(conn);
			}
		}else {
			chain.doFilter(request, response);
		}

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
