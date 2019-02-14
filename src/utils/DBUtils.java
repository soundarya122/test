package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.beans.Product;
import main.beans.Topic;
import main.beans.UserAccount;

public class DBUtils {

	public static UserAccount findUser(Connection conn, String username, String password) throws SQLException {
		String sql = "select a.user_name, a.password, a.gender from user_account a where a.user_name = ? and a.password = ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, username);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String gender = rs.getString("Gender");
			UserAccount user = new UserAccount(username, password, gender);
			return user;
		}
		return null;
	}
	public static List<Product> queryProduct(Connection conn) throws SQLException{
		String sql = "Select a.code, a.name, a.price from product a";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product product = new Product(rs.getString("code"), rs.getString("name"), rs.getInt("price"));
			list.add(product);
		}
		return list;
	}
	public static void insertProduct(Connection conn, Product product) throws SQLException{
		String sql = "insert into product(code, name, price) values(?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, product.getCode());
		pstm.setString(2, product.getName());
		pstm.setFloat(3, product.getPrice());
		pstm.executeUpdate();
	}
	public static List<Topic> topics(Connection conn) throws SQLException{
		String sql = "select a.id, a.name, b.id as parentId, b.name as parent, a.link from sub_topics as a right join topics as b on a.topic_id = b.id";
		
		ResultSet rs = conn.createStatement().executeQuery(sql);
		List<Topic> topicList = new ArrayList<>();
		while(rs.next()) {
			Topic topic = new Topic(rs.getInt("id"), rs.getString("name"), rs.getInt("parentId"), rs.getString("parent"), rs.getString("link"));
			topicList.add(topic);
		}
		return topicList;
	}
}
