<%@page import="java.sql.Connection"%>
<%@page import="main.conn.ConnectionUtils"%>
<%@page import="java.sql.SQLException"%>
<%@page import="utils.DBUtils"%>
<%@page import="main.beans.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.util.ResourceBundle"%>
<jsp:include page="templates/top.jsp"></jsp:include>
<%

Connection conn = ConnectionUtils.getConnection();
List<Product> list = null;
try {
	list = DBUtils.queryProduct(conn);
}catch(SQLException e) {
	e.printStackTrace();
}

request.setAttribute("productList", list);

	ResourceBundle rb = (ResourceBundle) session.getAttribute("rb");
%>
	<!-- HK Wrapper -->
	<div class="hk-wrapper hk-vertical-nav">

		<jsp:include page="templates/verticalNav.jsp"></jsp:include>
		<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<!-- Breadcrumb -->
			<nav class="hk-breadcrumb" aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-light bg-transparent">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">Responsive
						Table</li>
				</ol>
			</nav>
			<!-- /Breadcrumb -->

			<div class="container">

				<!-- Title -->
				<div class="hk-pg-header">
					<h4 class="hk-pg-title">
						<span class="pg-title-icon"><span class="feather-icon"><i
								data-feather="smartphone"></i></span></span>JDBC
					</h4>
				</div>
				<!-- /Title -->
				<div class="row">
					<div class="col-xl-12">
						<section class="hk-sec-wrapper">
							<!-- <h5 class="hk-sec-title">Mode Switch Table</h5> -->
							<p class="mb-40"><%=rb.getString("listAllProduct") %></p>
							<div class="row">
								<div class="col-sm">
									<div class="table-wrap">
										<table class="table tablesaw table-bordered table-hover  mb-0">
											<thead>
												<tr>
													<th scope="col" data-tablesaw-sortable-col
														data-tablesaw-priority="persist">Code</th>
													<th scope="col" data-tablesaw-sortable-col
														data-tablesaw-sortable-default-col
														data-tablesaw-priority="3">Name</th>
													<th scope="col" data-tablesaw-sortable-col
														data-tablesaw-priority="2">Price</th>
													<th scope="col" data-tablesaw-sortable-col
														data-tablesaw-priority="1"><abbr
														title="Rotten Tomato Rating">Edit</abbr></th>
													<th scope="col" data-tablesaw-sortable-col
														data-tablesaw-priority="4">Delete</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${productList}" var="product">
													<tr>
														<td class="title">${product.code}</td>
														<td>${product.name}</td>
														<td>${product.price}</td>
														<td><a href="editProduct?code=${product.code}">Edit</a>
														</td>
														<td><a href="deleteProduct?code=${product.code}">Delete</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			<!-- /Container -->

			<jsp:include page="templates/footerNav.jsp"></jsp:include>

		</div>
		<!-- /Main Content -->
	</div>
	<!-- /HK Wrapper -->
</body>
</html>
</body>
</html>