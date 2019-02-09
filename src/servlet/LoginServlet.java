package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.beans.UserAccount;
import main.conn.MyUtils;
import utils.DBUtils;

@WebServlet(urlPatterns= {"/login"})
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		
		UserAccount user = null;
		String errorString = null;
		boolean hasError = false;
		
		if(username == null || password == null) {
			errorString = "Required username and password";
		}else {
			Connection conn = MyUtils.retrieveConnection(request);
			try {
				user = DBUtils.findUser(conn, username);
				if(user == null) {
					errorString = "Username or password invalid";
				}
			}catch(SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		}
	}

}
