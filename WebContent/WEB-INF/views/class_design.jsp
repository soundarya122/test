<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.util.ResourceBundle"%>
<jsp:include page="templates/top.jsp"></jsp:include>
<%
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
								data-feather="smartphone"></i></span></span><%=rb.getString("productList") %>
					</h4>
				</div>
				<!-- /Title -->

				<div class="row">
					<div class="col-xl-12">
						<section class="hk-sec-wrapper">
							<!-- <h5 class="hk-sec-title">Mode Switch Table</h5> -->
							<p class="mb-40"><%=rb.getString("listAllProduct") %></p>
							
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