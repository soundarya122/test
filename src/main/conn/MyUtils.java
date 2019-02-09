package main.conn;

import java.sql.Connection;
import java.util.stream.Stream;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.beans.UserAccount;

public class MyUtils {
	public static final String ConnectionAttrib = "CONNECTION_ATTRIBUTE";
	public static final String LoggedinUser = "LOGGEDIN_USER";
	public static final String CookieChecked = "COOKIECHECKED";
	
	public static void storeConnection(ServletRequest request, Connection conn) {
		request.setAttribute(ConnectionAttrib, conn);
	}
	public static Connection retrieveConnection(ServletRequest request) {
		Connection conn = (Connection) request.getAttribute(ConnectionAttrib);
		return conn;
	}
	
	public static void storeUser(HttpSession session, UserAccount user) {
		session.setAttribute(LoggedinUser, user);
	}
	public static UserAccount retrieveUser(HttpSession session) {
		UserAccount user = (UserAccount)session.getAttribute(LoggedinUser);
		return user;
	}
	
	public static void storeUserCookie(HttpServletResponse response, UserAccount user) {
		Cookie cookie = new Cookie(LoggedinUser, user.getUserName());
		cookie.setMaxAge(24*60*60);
		response.addCookie(cookie);
	}
	public static String retrieveUserCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie:cookies) {
				if(LoggedinUser.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
}
