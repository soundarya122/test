package main.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.beans.Topic;
import main.beans.UserAccount;
import main.conn.ConnectionUtils;
import main.conn.MyUtils;
import utils.DBUtils;

@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		boolean remember = "Y".equals(rememberMe);
		
		UserAccount user = null;
		String errorString = null;
		boolean hasError = false;
		Connection conn = null;
		
		if(username.equals("") || password.equals("")) {
			hasError = true;
			errorString = "Required username and password";
		}else {
			try {
				conn = ConnectionUtils.getConnection();
				user = DBUtils.findUser(conn, username);
				if(user == null) {
					hasError = true;
					errorString = "Username or password invalid";
				}
			}catch(SQLException | ClassNotFoundException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		}
		if(hasError) {
			user = new UserAccount(username, password);
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
			dispatcher.forward(request, response);
		}else {
			HttpSession session = request.getSession();
			MyUtils.storeUser(session, user);
			if(remember) {
				MyUtils.storeUserCookie(response, user);
			}
			
			List<Topic> topicList=null;
			try {
				topicList = DBUtils.topics(conn);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			Map<String, Map<String, String>> listMenus = new HashMap<String, Map<String, String>>();
			Map<String, String> list = null;
			for(Topic topic:topicList) {
				String parentName = topic.getParentId()+". "+topic.getParent();
				if(topic.getName() != null) {
					String topicName = topic.getName().replace(",", "");
					if(listMenus.containsKey(parentName)) {
						list = listMenus.get(parentName);
						list.put(topicName, topic.getLink());
					} else {
						list = new HashMap<>();
						list.put(topicName, topic.getLink());
						listMenus.put(parentName, list);
					}
				}else {
					list = new HashMap<>();
					listMenus.put(parentName, list);
				}
			}
			SortedMap<String, Map<String, String>> sortedMap = new TreeMap(new MyCompartor());
			sortedMap.putAll(listMenus);
			session.setAttribute("listMenus", sortedMap);
			response.sendRedirect(request.getContextPath()+"/userInfo");
		}
	}
}

class MyCompartor implements Comparator<String>{
	@Override
	public int compare(String o1, String o2) {
		Integer i1 = Integer.parseInt(o1.split("\\.")[0]);
		Integer i2 = Integer.parseInt(o2.split("\\.")[0]);
		return i1.compareTo(i2);
	}
}
