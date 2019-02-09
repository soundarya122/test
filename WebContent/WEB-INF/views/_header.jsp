<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div style="background-color: #e0e0e0; height: 55px; padding: 5px;">
	<div style="float: left">
		<h1>MySite</h1>
	</div>

	<div style="float: right; padding: 10px; text-align: right;">
		Hello <b>${LOGGEDIN_USER.userName}</b> <br /> Search <input
			name="search">
	</div>

</div>