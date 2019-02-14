package main.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.beans.Product;
import main.conn.ConnectionUtils;
import utils.DBUtils;

@WebServlet("/controller")
public class Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selectedTopic = req.getParameter("id");
		if(selectedTopic == null)
			return;
		if(selectedTopic.equals("localization")) {
			String s = req.getParameter("val");
			String s1 = req.getParameter("resourceBundle");
			if(s != null) {
				List<Locale> list = new ArrayList();
		
				resp.setContentType("text/html");
				PrintWriter out = resp.getWriter();
				out.println("<table class=\"table tablesaw table-bordered table-hover  mb-0\">");
				out.println("<thead><tr><th>Country code</th><th>Display Country</th><th>Display Name</th></tr></thead>");
				if (s != null) {
					if(s== "") {
						
					}else {
						Locale[] l = Locale.getAvailableLocales();
						list = Arrays.stream(l).filter(i1 -> i1.getDisplayCountry().toLowerCase().contains(s.toLowerCase())).collect(Collectors.toList());
						list.forEach(i3 -> {
							try {
								out.println("<tr><td>"+i3.getCountry()+"</td><td>"+ i3.getDisplayCountry()+"</td><td>" + i3.getDisplayName()+"</td></tr>");
							} catch (Exception e) {
							}
						});
					}
				}
				out.println("</table>");
			}
			if(s1 != null) {
				Locale locale = Locale.getDefault();
				Locale.setDefault(new Locale(s1));
				ResourceBundle resource = ResourceBundle.getBundle("Resource", locale);
				PrintWriter out = resp.getWriter();
				out.print("Greeting: "+ resource.getString("Greeting"));
			}
		}
		if(selectedTopic.equals("jdbc")) {
			String pCode = req.getParameter("pCode");
			String pName = req.getParameter("pName");
			Float pPrice = Float.parseFloat(req.getParameter("pPrice"));
			
			Product product = new Product(pCode, pName, pPrice);
			
			Connection conn = null;
			try {
				conn = ConnectionUtils.getConnection();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			List<Product> list = null;
			try {
				DBUtils.insertProduct(conn, product);
				list = DBUtils.queryProduct(conn);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			
			
		}
			
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
