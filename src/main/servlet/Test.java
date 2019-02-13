package main.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test")
public class Test extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s = req.getParameter("val");
		List<Locale> list = new ArrayList();

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("<table class=\"table tablesaw table-bordered table-hover  mb-0\">");
		out.println("<thead><tr><th>Country code</th><th>Display Country</th><th>DisplayName</th></tr></thead>");
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

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
