<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
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

<!-- Toggles CSS -->
<link href="vendors/jquery-toggles/css/toggles.css" rel="stylesheet"
	type="text/css">
<link href="vendors/jquery-toggles/css/themes/toggles-light.css"
	rel="stylesheet" type="text/css">

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

			<!-- Container -->
			<div class="container mt-xl-50 mt-sm-30 mt-15">
                <!-- Title -->
                <div class="hk-pg-header align-items-top">
                    <div>
						<h2 class="hk-pg-title font-weight-600 mb-10"><%=rb.getString("welcome") %>:  ${user.userName.toUpperCase()}</h2>
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