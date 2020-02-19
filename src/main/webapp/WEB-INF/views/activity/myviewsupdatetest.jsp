<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>TaiwanFilms</title>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>	
<style type="text/css">
fieldset {
	border: 1px solid black;
	width: 600px;
	margin: auto;
	padding: 10px;
}

textarea{
	width: 100%;
}
.inner {
	vertical-align: top;
}

input {
	width: 100%;
}

body{
	background-color: #f1f1f1;
}
</style>
<title>updateActivity</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />

</head>
<body onload="enter()">
	<jsp:include page="../fragment/menu.jsp" />


	<section>
		<div class="container">
			<h1 style="text-align: center">修改產品資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!-- 三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="activityBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>

	
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"
						for='activityWatched'> 點閱次數 </label>
					<div class="col-lg-10">
						<form:textarea  cols="60" rows="1" id="activityWatched" path="activityWatched"
							type='text' class='form:input-large' />
							
					</div>
				</div>	
				
							
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
								value="送出" />	
					</div>
				</div>
			</fieldset>
		</form:form>

	</section>




	
</body>

</html>


