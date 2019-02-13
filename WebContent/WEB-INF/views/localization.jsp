<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ResourceBundle"%>
<jsp:include page="templates/top.jsp"></jsp:include>
<%
	ResourceBundle rb = (ResourceBundle) session.getAttribute("rb");
	String spath = request.getServletContext().getContextPath();
	
%>
<script type="text/javascript">
	function sendInfo() {
		var v = document.vinform.t1.value;
		var url = document.vinform.t2.value+"/test?val=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('amit').innerHTML=val;  
		}
	}
</script>
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
							data-feather="smartphone"></i></span></span>Resource Bundle
				</h4>
			</div>
			<!-- /Title -->

			<div class="row">
				<div class="col-xl-12">
					<section class="hk-sec-wrapper">
						<!-- <h5 class="hk-sec-title">Mode Switch Table</h5> -->
						<p class="mb-40">1. Get list of available locales</p>
						<form name="vinform">Display Country 
							<input name="t1" type="text" onkeyup="sendInfo()" />
							<input name="t2" type="text" value="<%=spath %>" hidden="true" />
								
						</form>
						<span id="amit"  onload="sendInfo()" style="padding: 10px;"> </span>  


					</section>
				</div>
			</div>
			
			<!-- Title -->
			<div class="hk-pg-header">
				<h4 class="hk-pg-title">
					<span class="pg-title-icon"><span class="feather-icon"><i
							data-feather="smartphone"></i></span></span>Localization
				</h4>
			</div>
			<!-- /Title -->

			<div class="row">
				<div class="col-xl-12">
					<section class="hk-sec-wrapper">
						<!-- <h5 class="hk-sec-title">Mode Switch Table</h5> -->
						<p class="mb-40">1. Get list of available locales</p>
						<form name="vinform1">Display Country 
							<input
								name="t1" type="text" onkeyup="sendInfo()" />
								
						</form>
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