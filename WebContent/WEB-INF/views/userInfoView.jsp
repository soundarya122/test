<%@page import="java.util.ResourceBundle"%>
<%
	ResourceBundle rb = (ResourceBundle) session.getAttribute("rb");
%>
<jsp:include page="templates/top.jsp"></jsp:include>
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
					<h2 class="hk-pg-title font-weight-600 mb-10"><%=rb.getString("welcome")%>:
						${user.userName.toUpperCase()}
					</h2>
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