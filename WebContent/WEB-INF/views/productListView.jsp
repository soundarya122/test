<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>Pangong I Invoice</title>
<meta name="description"
	content="A responsive bootstrap 4 admin dashboard template by hencework" />
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Tablesaw table CSS -->
    <link href="vendors/tablesaw/dist/tablesaw.css" rel="stylesheet" type="text/css" />

    <!-- Toggles CSS -->
    <link href="vendors/jquery-toggles/css/toggles.css" rel="stylesheet" type="text/css">
    <link href="vendors/jquery-toggles/css/themes/toggles-light.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="dist/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
		ResourceBundle rb = (ResourceBundle)session.getAttribute("rb");
	%>
	<!-- Preloader -->
	<div class="preloader-it">
		<div class="loader-pendulums"></div>
	</div>
	<!-- /Preloader -->
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
							<div class="row">
								<div class="col-sm">
									<div class="table-wrap">
										<table class="table tablesaw table-bordered table-hover  mb-0"
											data-tablesaw-mode="swipe" data-tablesaw-sortable
											data-tablesaw-sortable-switch data-tablesaw-minimap
											data-tablesaw-mode-switch>
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