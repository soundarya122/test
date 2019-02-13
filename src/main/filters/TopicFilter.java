package main.filters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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

/**
 * Servlet Filter implementation class TopicFilter
 */
@WebFilter(filterName = "topicFilter", urlPatterns = { "/*" })
public class TopicFilter implements Filter {

	private String availableTopics = "";
	private List<String> servlets = new ArrayList<>();
    /**
     * Default constructor. 
     */
    public TopicFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        System.out.println("----3) TopicFilter FILTER.... >> " + request.getServletPath());
        String Uri = request.getServletPath().toLowerCase();
        
        for(int i=0; i<servlets.size(); i++) {
        	System.out.println("uri: "+ Uri);
        	System.out.println("servlets: "+ servlets.get(i).toLowerCase());
        	if(Uri.contains(servlets.get(i).toLowerCase())) {
        		System.out.println("-- "+servlets.get(i));
        		String servlet = "/WEB-INF/views/"+servlets.get(i)+".jsp";
        		RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher(servlet);
        		dispatcher.forward(request, response);
        		return;
        	}
        }
        
        
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		availableTopics = "class_design,advanced_design";
		StringTokenizer str = new StringTokenizer(availableTopics, ",");
		while(str.hasMoreTokens()) {
			servlets.add(str.nextToken());
		}
	}

}