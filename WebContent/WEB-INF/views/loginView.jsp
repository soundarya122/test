<%@page import="java.io.Console"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="dist/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="preloader-it">
		<div class="loader-pendulums"></div>
	</div>
	<!-- /Preloader -->

	<!-- HK Wrapper -->
	<div class="hk-wrapper">

		<!-- Main Content -->
		<div class="hk-pg-wrapper hk-auth-wrapper">
			<header class="d-flex justify-content-between align-items-center">
				<a class="d-flex auth-brand" href="#"> <img class="brand-img"
					src="dist/img/logo-dark.png" alt="brand" />
				</a>
				<div class="btn-group btn-group-sm">
					<a href="#" class="btn btn-outline-secondary">Help</a> <a href="#"
						class="btn btn-outline-secondary">About Us</a>
				</div>
			</header>
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-5 pa-0">
						<div id="owl_demo_1" class="owl-carousel dots-on-item owl-theme">
							<div class="fadeOut item auth-cover-img overlay-wrap"
								style="background-image: url(dist/img/IMG_2995-1.jpg);">
								<div class="auth-cover-info py-xl-0 pt-100 pb-50">
									<div
										class="auth-cover-content text-center w-xxl-75 w-sm-90 w-xs-100">
										<h1 class="display-3 text-white mb-20">Understand and
											look deep into nature.</h1>
										<p class="text-white">The purpose of lorem ipsum is to
											create a natural looking block of text (sentence, paragraph,
											page, etc.) that doesn't distract from the layout. Again
											during the 90s as desktop publishers bundled the text with
											their software.</p>
									</div>
								</div>
								<div class="bg-overlay bg-trans-dark-50"></div>
							</div>
							<div class="fadeOut item auth-cover-img overlay-wrap"
								style="background-image: url(dist/img/Experiences_Beach.jpg);">
								<div class="auth-cover-info py-xl-0 pt-100 pb-50">
									<div
										class="auth-cover-content text-center w-xxl-75 w-sm-90 w-xs-100">
										<h1 class="display-3 text-white mb-20">Experience matters
											for good applications.</h1>
										<p class="text-white">The passage experienced a surge in
											popularity during the 1960s when Letraset used it on their
											dry-transfer sheets, and again during the 90s as desktop
											publishers bundled the text with their software.</p>
									</div>
								</div>
								<div class="bg-overlay bg-trans-dark-50"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-7 pa-0">
						<div class="auth-form-wrap py-xl-0 py-50">
							<div class="auth-form w-xxl-55 w-xl-75 w-sm-90 w-xs-100">
								<form method="POST"
									action="${pageContext.request.contextPath}/login">
									<h1 class="display-4 mb-10">Welcome Back :)</h1>
									<p class="mb-30">Sign in to your account and enjoy
										unlimited perks.</p>
									<div class="form-group">
										<input class="form-control" placeholder="Email" type="text"
											name="userName" value="${user.userName}">
									</div>
									<div class="form-group">
										<div class="input-group">
											<input class="form-control" placeholder="Password"
												type="password" name="password" value="${user.password}">
											<div class="input-group-append">
												<span class="input-group-text"><span
													class="feather-icon"><i data-feather="eye-off"></i></span></span>
											</div>
										</div>
									</div>
									<div class="custom-control custom-checkbox mb-25">
										<input class="custom-control-input" id="rememberMe"
											type="checkbox" name="rememberMe" value="Y" checked>
										<label class="custom-control-label font-14" for="same-address">Keep
											me logged in</label>
									</div>

									<%
										String errorString = (String)request.getAttribute("errorString");
										if (errorString != null) {
											%>
											<div
												class="alert alert-inv alert-inv-danger alert-wth-icon alert-dismissible fade show"
												role="alert" id="info1">
												<span class="alert-icon-wrap"><i class="zmdi zmdi-bug"></i></span>${errorString}
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<%
										}
									%>



									<button class="btn btn-primary btn-block" type="submit">Login</button>
									<p class="font-14 text-center mt-15">Having trouble logging
										in?</p>
									<div class="option-sep">or</div>
									<div class="form-row">
										<div class="col-sm-6 mb-20">
											<button class="btn btn-indigo btn-block btn-wth-icon">
												<span class="icon-label"><i class="fa fa-facebook"></i>
												</span><span class="btn-text">Login with facebook</span>
											</button>
										</div>
										<div class="col-sm-6 mb-20">
											<button class="btn btn-primary btn-block btn-wth-icon">
												<span class="icon-label"><i class="fa fa-twitter"></i>
												</span><span class="btn-text">Login with Twitter</span>
											</button>
										</div>
									</div>
									<p class="text-center">
										Do have an account yet? <a href="#">Sign Up</a>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Main Content -->

	</div>

	<script src="vendors/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Slimscroll JavaScript -->
	<script src="dist/js/jquery.slimscroll.js"></script>

	<!-- Fancy Dropdown JS -->
	<script src="dist/js/dropdown-bootstrap-extended.js"></script>

	<!-- Owl JavaScript -->
	<script src="vendors/owl.carousel/dist/owl.carousel.min.js"></script>

	<!-- FeatherIcons JavaScript -->
	<script src="dist/js/feather.min.js"></script>

	<!-- Init JavaScript -->
	<script src="dist/js/init.js"></script>
	<script src="dist/js/login-data.js"></script>
</body>
</html>