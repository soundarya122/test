<!-- Top Navbar -->
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<nav class="navbar navbar-expand-xl navbar-light fixed-top hk-navbar">
	<a id="navbar_toggle_btn" class="navbar-toggle-btn nav-link-hover"
		href="javascript:void(0);"><span class="feather-icon"><i
			data-feather="menu"></i></span></a> <a class="navbar-brand"
		href="dashboard1.html"> <img class="brand-img d-inline-block"
		src="dist/img/logo-light.png" alt="brand" />
	</a>
	<ul class="navbar-nav hk-navbar-content">

		<li><a class="nav-link" href="locale?lang=en"><img
				src="images/flags/flag1.png" /></a></li>
		<li><a class="nav-link" href="locale?lang=sp"><img
				src="images/flags/flag2.png" /></a></li>
		<li><a class="nav-link" href="locale?lang=in"><img
				src="images/flags/flag3.png" /></a></li>

		<li class="nav-item"><a id="navbar_search_btn"
			class="nav-link nav-link-hover" href="javascript:void(0);"><span
				class="feather-icon"><i data-feather="search"></i></span></a></li>
		<li class="nav-item"><a id="settings_toggle_btn"
			class="nav-link nav-link-hover" href="javascript:void(0);"><span
				class="feather-icon"><i data-feather="settings"></i></span></a></li>
		<li class="nav-item dropdown dropdown-notifications"><a
			class="nav-link dropdown-toggle no-caret" href="#" role="button"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span
				class="feather-icon"><i data-feather="bell"></i></span><span
				class="badge-wrap"><span
					class="badge badge-primary badge-indicator badge-indicator-sm badge-pill pulse"></span></span></a>
			<div class="dropdown-menu dropdown-menu-right"
				data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
				<h6 class="dropdown-header">
					Notifications <a href="javascript:void(0);" class="">View all</a>
				</h6>
				<div class="notifications-nicescroll-bar">
					<a href="javascript:void(0);" class="dropdown-item">
						<div class="media">
							<div class="media-img-wrap">
								<div class="avatar avatar-sm">
									<img src="dist/img/avatar1.jpg" alt="user"
										class="avatar-img rounded-circle">
								</div>
							</div>
							<div class="media-body">
								<div>
									<div class="notifications-text">
										<span class="text-dark text-capitalize">Evie Ono</span>
										accepted your invitation to join the team
									</div>
									<div class="notifications-time">12m</div>
								</div>
							</div>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="javascript:void(0);" class="dropdown-item">
						<div class="media">
							<div class="media-img-wrap">
								<div class="avatar avatar-sm">
									<img src="dist/img/avatar2.jpg" alt="user"
										class="avatar-img rounded-circle">
								</div>
							</div>
							<div class="media-body">
								<div>
									<div class="notifications-text">
										New message received from <span
											class="text-dark text-capitalize">Misuko Heid</span>
									</div>
									<div class="notifications-time">1h</div>
								</div>
							</div>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="javascript:void(0);" class="dropdown-item">
						<div class="media">
							<div class="media-img-wrap">
								<div class="avatar avatar-sm">
									<span class="avatar-text avatar-text-primary rounded-circle">
										<span class="initial-wrap"><span><i
												class="zmdi zmdi-account font-18"></i></span></span>
									</span>
								</div>
							</div>
							<div class="media-body">
								<div>
									<div class="notifications-text">
										You have a follow up with<span
											class="text-dark text-capitalize"> Pangong head</span> on <span
											class="text-dark text-capitalize">friday, dec 19</span> at <span
											class="text-dark">10.00 am</span>
									</div>
									<div class="notifications-time">2d</div>
								</div>
							</div>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="javascript:void(0);" class="dropdown-item">
						<div class="media">
							<div class="media-img-wrap">
								<div class="avatar avatar-sm">
									<span class="avatar-text avatar-text-success rounded-circle">
										<span class="initial-wrap"><span>A</span></span>
									</span>
								</div>
							</div>
							<div class="media-body">
								<div>
									<div class="notifications-text">
										Application of <span class="text-dark text-capitalize">Sarah
											Williams</span> is waiting for your approval
									</div>
									<div class="notifications-time">1w</div>
								</div>
							</div>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="javascript:void(0);" class="dropdown-item">
						<div class="media">
							<div class="media-img-wrap">
								<div class="avatar avatar-sm">
									<span class="avatar-text avatar-text-warning rounded-circle">
										<span class="initial-wrap"><span><i
												class="zmdi zmdi-notifications font-18"></i></span></span>
									</span>
								</div>
							</div>
							<div class="media-body">
								<div>
									<div class="notifications-text">Last 2 days left for the
										project</div>
									<div class="notifications-time">15d</div>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div></li>
		<li class="nav-item dropdown dropdown-authentication"><a
			class="nav-link dropdown-toggle no-caret" href="#" role="button"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<div class="media">
					<div class="media-img-wrap">
						<div class="avatar">
							<img src="dist/img/avatar12.jpg" alt="user"
								class="avatar-img rounded-circle">
						</div>
						<span class="badge badge-success badge-indicator"></span>
					</div>
					<div class="media-body">
						<span>Madelyn Shane<i class="zmdi zmdi-chevron-down"></i></span>
					</div>
				</div>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				data-dropdown-in="flipInX" data-dropdown-out="flipOutX">
				<a class="dropdown-item" href="profile.html"><i
					class="dropdown-icon zmdi zmdi-account"></i><span>Profile</span></a> <a
					class="dropdown-item" href="#"><i
					class="dropdown-icon zmdi zmdi-card"></i><span>My balance</span></a> <a
					class="dropdown-item" href="inbox.html"><i
					class="dropdown-icon zmdi zmdi-email"></i><span>Inbox</span></a> <a
					class="dropdown-item" href="#"><i
					class="dropdown-icon zmdi zmdi-settings"></i><span>Settings</span></a>
				<div class="dropdown-divider"></div>
				<div class="sub-dropdown-menu show-on-hover">
					<a href="#" class="dropdown-toggle dropdown-item no-caret"><i
						class="zmdi zmdi-check text-success"></i>Online</a>
					<div class="dropdown-menu open-left-side">
						<a class="dropdown-item" href="#"><i
							class="dropdown-icon zmdi zmdi-check text-success"></i><span>Online</span></a>
						<a class="dropdown-item" href="#"><i
							class="dropdown-icon zmdi zmdi-circle-o text-warning"></i><span>Busy</span></a>
						<a class="dropdown-item" href="#"><i
							class="dropdown-icon zmdi zmdi-minus-circle-outline text-danger"></i><span>Offline</span></a>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="logout"><i
					class="dropdown-icon zmdi zmdi-power"></i><span>Log out</span></a>
			</div></li>
	</ul>
</nav>
<form role="search" class="navbar-search">
	<div class="position-relative">
		<a href="javascript:void(0);" class="navbar-search-icon"><span
			class="feather-icon"><i data-feather="search"></i></span></a> <input
			type="text" name="example-input1-group2" class="form-control"
			placeholder="Type here to Search"> <a
			id="navbar_search_close" class="navbar-search-close" href="#"><span
			class="feather-icon"><i data-feather="x"></i></span></a>
	</div>
</form>
<!-- /Top Navbar -->
<!-- Vertical Nav -->
<nav class="hk-nav hk-nav-dark">
	<a href="javascript:void(0);" id="hk_nav_close" class="hk-nav-close"><span
		class="feather-icon"><i data-feather="x"></i></span></a>
	<div class="nicescroll-bar">
		<div class="navbar-nav-wrap">
			<ul class="navbar-nav flex-column">
				<li class="nav-item"><a class="nav-link"
					href="javascript:void(0);" data-toggle="collapse"
					data-target="#dash_drp"> <span class="feather-icon"><i
							data-feather="activity"></i></span> <span class="nav-link-text">Dashboard</span>
				</a>
					<ul id="dash_drp" class="nav flex-column collapse collapse-level-1">
						<li class="nav-item">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="dashboard1.html">CRM</a></li>
								<li class="nav-item"><a class="nav-link"
									href="dashboard2.html">Project</a></li>
								<li class="nav-item"><a class="nav-link"
									href="dashboard3.html">Statistics</a></li>
							</ul>
						</li>
					</ul></li>
				<li class="nav-item"><a class="nav-link link-with-badge"
					href="javascript:void(0);" data-toggle="collapse"
					data-target="#app_drp"> <span class="feather-icon"><i
							data-feather="package"></i></span> <span class="nav-link-text">Application</span>
						<span class="badge badge-primary badge-pill">4</span>
				</a>
					<ul id="app_drp" class="nav flex-column collapse collapse-level-1">
						<li class="nav-item">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="chats.html">Chat</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="calendar.html">Calendar</a></li>
								<li class="nav-item"><a class="nav-link" href="email.html">Email</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="file-manager.html">File Manager</a></li>
							</ul>
						</li>
					</ul></li>
				<li class="nav-item"><a class="nav-link"
					href="javascript:void(0);" data-toggle="collapse"
					data-target="#auth_drp"> <span class="feather-icon"><i
							data-feather="zap"></i></span> <span class="nav-link-text">Authentication</span>
				</a>
					<ul id="auth_drp" class="nav flex-column collapse collapse-level-1">
						<li class="nav-item">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link"
									href="javascript:void(0);" data-toggle="collapse"
									data-target="#signup_drp"> Sign Up </a>
									<ul id="signup_drp"
										class="nav flex-column collapse collapse-level-2">
										<li class="nav-item">
											<ul class="nav flex-column">
												<li class="nav-item"><a class="nav-link"
													href="signup.html">Cover</a></li>
												<li class="nav-item"><a class="nav-link"
													href="signup-simple.html">Simple</a></li>
											</ul>
										</li>
									</ul></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript:void(0);" data-toggle="collapse"
									data-target="#signin_drp"> Login </a>
									<ul id="signin_drp"
										class="nav flex-column collapse collapse-level-2">
										<li class="nav-item">
											<ul class="nav flex-column">
												<li class="nav-item"><a class="nav-link"
													href="login.html">Cover</a></li>
												<li class="nav-item"><a class="nav-link"
													href="login-simple.html">Simple</a></li>
											</ul>
										</li>
									</ul></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript:void(0);" data-toggle="collapse"
									data-target="#recover_drp"> Recover Password </a>
									<ul id="recover_drp"
										class="nav flex-column collapse collapse-level-2">
										<li class="nav-item">
											<ul class="nav flex-column">
												<li class="nav-item"><a class="nav-link"
													href="forgot-password.html">Forgot Password</a></li>
												<li class="nav-item"><a class="nav-link"
													href="reset-password.html">Reset Password</a></li>
											</ul>
										</li>
									</ul></li>
								<li class="nav-item"><a class="nav-link"
									href="lock-screen.html">Lock Screen</a></li>
								<li class="nav-item"><a class="nav-link" href="404.html">Error
										404</a></li>
								<li class="nav-item"><a class="nav-link"
									href="maintenance.html">Maintenance</a></li>
							</ul>
						</li>
					</ul></li>
				<li class="nav-item active"><a class="nav-link"
					href="javascript:void(0);" data-toggle="collapse"
					data-target="#pages_drp"> <span class="feather-icon"><i
							data-feather="file-text"></i></span> <span class="nav-link-text">Pages</span>
				</a>
					<ul id="pages_drp"
						class="nav flex-column collapse collapse-level-1">
						<li class="nav-item">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="productList">Product
										List</a></li>
								<li class="nav-item active"><a class="nav-link"
									href="invoice.html">Invoice</a></li>
								<li class="nav-item"><a class="nav-link"
									href="gallery.html">Gallery</a></li>
								<li class="nav-item"><a class="nav-link"
									href="activity.html">Activity</a></li>
								<li class="nav-item"><a class="nav-link" href="faq.html">Faq</a>
								</li>
							</ul>
						</li>
					</ul></li>
			</ul>
			<hr class="nav-separator">
			<div class="nav-header">
				<span>User Interface</span> <span>UI</span>
			</div>
			<ul class="navbar-nav flex-column">

				<%
					Map listMenus = (Map) request.getSession().getAttribute("listMenus");
					if (listMenus != null) {
						Iterator<Map.Entry<String, Map>> entries = listMenus.entrySet().iterator();

						while (entries.hasNext()) {
							Map.Entry<String, Map> entry = entries.next();
							String dataTarget = entry.getKey().replace(" ", "_").replace(",", "_").replace(".", "_");
							String expanded = "false";
							String collapsed= "collapse";
							String active="";
							if(request.getServletPath().contains(dataTarget)){
								expanded = "true";
								collapsed = "collapse show";
								active=" active";
							}
				%>
				<li class="nav-item collapsed <%=active%>"><a class="nav-link"
					href="javascript:void(0);" data-toggle="collapse" aria-expanded="<%=expanded %>"
					data-target="#<%=dataTarget%>"> <span class="feather-icon"><i
							data-feather="layout"></i></span> <span class="nav-link-text"><%=entry.getKey()%></span></a>
					<%
						if (entry.getValue() instanceof Map) {
								Iterator<Map.Entry<String, Map>> subMenuLevel1 = entry.getValue().entrySet().iterator();
								int counter = 0;
								
									
					%>
					<ul id="<%=dataTarget%>"
						class="nav flex-column <%=collapsed %> collapse-level-1">
						<li class="nav-item">
							<ul class="nav flex-column">
								<%
									while (subMenuLevel1.hasNext()) {
													Map.Entry<String, Map> subEntries1 = subMenuLevel1.next();
													counter++;

													String s1;
													if(request.getServletPath().contains(dataTarget)){
														s1 = "#" + subEntries1.getValue();
													}else{
														s1 = dataTarget + "?topics=" + subEntries1.getValue();
													}
													
													String s2 = ""+subEntries1.getValue();
													String active1="";
													if(request.getParameter("topics") != null){
														if(request.getParameter("topics").equals(s2)){
															active1 = " active";
														}
													}
													
								%><li class="nav-item <%=active1 %>"><a class="nav-link" data-scroll href="<%=s1%>"><%=counter%>)
										<%=subEntries1.getKey()%></a></li>
								<%
									}
								%>
							</ul>
						</li>
					</ul> <%
 	}
 %></li>
				<%
					}
					}
				%>
			</ul>
			</li>
			</ul>
		</div>
	</div>
</nav>
<div id="hk_nav_backdrop" class="hk-nav-backdrop"></div>
<!-- /Vertical Nav -->

<!-- Setting Panel -->
<div class="hk-settings-panel">
	<div class="nicescroll-bar position-relative">
		<div class="settings-panel-wrap">
			<div class="settings-panel-head">
				<img class="brand-img d-inline-block align-top"
					src="dist/img/logo-light.png" alt="brand" /> <a
					href="javascript:void(0);" id="settings_panel_close"
					class="settings-panel-close"><span class="feather-icon"><i
						data-feather="x"></i></span></a>
			</div>
			<hr>
			<h6 class="mb-5">Layout</h6>
			<p class="font-14">Choose your preferred layout</p>
			<div class="layout-img-wrap">
				<div class="row">
					<a href="javascript:void(0);" class="col-6 mb-30 active"> <img
						class="rounded opacity-70" src="dist/img/layout1.png" alt="layout">
						<i class="zmdi zmdi-check"></i>
					</a> <a href="dashboard2.html" class="col-6 mb-30"> <img
						class="rounded opacity-70" src="dist/img/layout2.png" alt="layout">
						<i class="zmdi zmdi-check"></i>
					</a> <a href="dashboard3.html" class="col-6"> <img
						class="rounded opacity-70" src="dist/img/layout3.png" alt="layout">
						<i class="zmdi zmdi-check"></i>
					</a>
				</div>
			</div>
			<hr>
			<h6 class="mb-5">Navigation</h6>
			<p class="font-14">Menu comes in two modes: dark & light</p>
			<div class="button-list hk-nav-select mb-10">
				<button type="button" id="nav_light_select"
					class="btn btn-outline-light btn-sm btn-wth-icon icon-wthot-bg">
					<span class="icon-label"><i class="fa fa-sun-o"></i> </span><span
						class="btn-text">Light Mode</span>
				</button>
				<button type="button" id="nav_dark_select"
					class="btn btn-outline-primary btn-sm btn-wth-icon icon-wthot-bg">
					<span class="icon-label"><i class="fa fa-moon-o"></i> </span><span
						class="btn-text">Dark Mode</span>
				</button>
			</div>
			<hr>
			<h6 class="mb-5">Top Nav</h6>
			<p class="font-14">Choose your liked color mode</p>
			<div class="button-list hk-navbar-select mb-10">
				<button type="button" id="navtop_light_select"
					class="btn btn-outline-primary btn-sm btn-wth-icon icon-wthot-bg">
					<span class="icon-label"><i class="fa fa-sun-o"></i> </span><span
						class="btn-text">Light Mode</span>
				</button>
				<button type="button" id="navtop_dark_select"
					class="btn btn-outline-light btn-sm btn-wth-icon icon-wthot-bg">
					<span class="icon-label"><i class="fa fa-moon-o"></i> </span><span
						class="btn-text">Dark Mode</span>
				</button>
			</div>
			<hr>
			<div class="d-flex justify-content-between align-items-center">
				<h6>Scrollable Header</h6>
				<div
					class="toggle toggle-sm toggle-simple toggle-light toggle-bg-primary scroll-nav-switch"></div>
			</div>
			<button id="reset_settings"
				class="btn btn-primary btn-block btn-reset mt-30">Reset</button>
		</div>
	</div>
	<img class="d-none" src="dist/img/logo-light.png" alt="brand" /> <img
		class="d-none" src="dist/img/logo-dark.png" alt="brand" />
</div>
<!-- /Setting Panel -->

<jsp:include page="js.jsp"></jsp:include>