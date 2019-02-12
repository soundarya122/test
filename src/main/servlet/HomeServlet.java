package main.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.beans.UserAccount;

@WebServlet(urlPatterns= {"/index.html"})
public class HomeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession(false);
		
		UserAccount user = (UserAccount) session.getAttribute("user");
		RequestDispatcher dispatcher = null;
		if(user == null) {
			dispatcher = this.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(req, resp);
		}else {
			resp.sendRedirect(req.getContextPath()+"/userInfo");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
