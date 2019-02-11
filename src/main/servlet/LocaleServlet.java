package main.servlet;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet(urlPatterns= {"/locale"})
public class LocaleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lang = req.getParameter("lang");
		ResourceBundle rb = ResourceBundle.getBundle("app", new Locale(lang));
		HttpSession sess = req.getSession(false);
		sess.setAttribute("rb", rb);
		
//		System.out.println("sdfsd "+ req.getHeader("Referer")+":"+req.getContextPath()+":"+req.getServletPath());
		String lastServlet = req.getHeader("Referer").split(req.getContextPath()+"/")[1];
		resp.sendRedirect(lastServlet);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("locale do post");
	}
	
}
