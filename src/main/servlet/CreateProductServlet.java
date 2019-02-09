package main.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.beans.Product;
import main.conn.MyUtils;
import utils.DBUtils;

@WebServlet(urlPatterns= {"/createProduct"})
public class CreateProductServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/createProductView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = MyUtils.retrieveConnection(request);
		String code = (String)request.getParameter("code");
		String name = (String)request.getParameter("name");
		String priceStr = (String)request.getParameter("price");
		float price = 0;
		try {
			price = Float.parseFloat(priceStr);
		}catch(Exception e) {
			
		}
		Product product = new Product(code, name, price);
		try {
			DBUtils.insertProduct(conn, product);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/productList");
		
	}

}
