package main.servlet;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

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
import utils.DBUtils;

@WebServlet(urlPatterns= {"/userInfo"})
public class UserInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
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
		
		
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/userInfoView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
class MyCompartor implements Comparator<String>, Serializable{
	@Override
	public int compare(String o1, String o2) {
		Integer i1 = Integer.parseInt(o1.split("\\.")[0]);
		Integer i2 = Integer.parseInt(o2.split("\\.")[0]);
		return i1.compareTo(i2);
	}
}
