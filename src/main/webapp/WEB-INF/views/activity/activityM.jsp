<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<title>TaiwanFilms</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<style>
.container h2{
	font-size: 40px;
	font-weight: bold;
	text-align: center;
}
.row{
	min-width: 1000px;
}
.row img{
	width:75%;
	height: 100%;
}

.col-md-5{
	width: 100%;
	font-size: 20px;
}
.container{
width: 80%;display: inline-block;position: absolute;left: 17%}
  

</style>
</head>
<body>

	<jsp:include page="../backstage.jsp" />




		<section class="container">
			<h2>${activity.activityTitle}</h2>
			<hr>
			<div class="row">  
				<div style="text-align: center;	text-align: center; 
						background-position: center;
						background-repeat: no-repeat;
						background-image: url('../getPicture/${activity.activityId}');
						height: 500px;
						background-size: 100%">
					 
				</div>
				<hr> 
				<div class="col-md-5">
					<h2>${activity.activityTitle}</h2>
					<h3 style="font-size: 20px;text-align: center">${activity.activityMainContent}</h3>
					<p style="font-size: 18px">${activity.activityContent}</p>
					<p>所屬類別: ${activity.category}</p>
					
					<p>
						<strong>活動編號: </strong> <span class='label label-warning'>
							${activity.activityId} </span>
					</p>  
					<p>  
					<a href="<spring:url value='/activitiesM' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href="<spring:url value='/update/activities/${activity.activityId}' />"
						class="btn btn-default"> <span
						class="glyphicon-hand-left glyphicon" style="width: 40%;display: inline-block"></span>修改
					</a> 
						<%-- <a href="<spring:url value='/SignUpActivity?id=${activity.activityId}' />"class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>註冊活動</a> --%>
					</p>
				</div>  
			</div>
		</section>
					





</body>
</html>
