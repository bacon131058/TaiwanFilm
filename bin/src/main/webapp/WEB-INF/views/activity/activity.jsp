<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
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

.activityImg{
	text-align: center;
	background-position: center;
	background-repeat: no-repeat;
	background-image: url('getPicture/${activity.activityId}');
	height: 500px;
}
</style>
</head>
<body>

<jsp:include page="../fragment/menu.jsp" />




	<section class="container">
		<h2>${activity.activityTitle}</h2>
		<hr>
		<div class="row">
			<div class="activityimg">
				<%-- <img src="<c:url value='/getPicture/${activity.activityId}'/>" /> --%>
			</div>	
			<hr>
			<div class="col-md-5">
				<h2>${activity.activityTitle}</h2>
				<h3 style="font-size: 20px;text-align: center">${activity.activityMainContent}</h3>
				<p style="font-size: 18px">${activity.activityContent}</p>
				<p style="font-size: 18px">活動狀態: ${activity.status}</p>	
					<strong>活動編號: </strong> <span class='label label-warning'>
						${activity.activityId} </span>
				</p>
				<p>
					<a href="<spring:url value='/activities' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href="<spring:url value='/activities' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>報名活動
					</a> 
				</p> 
			</div>
		</div>
	</section>

	<jsp:include page="../fragment/footer.jsp" /> 
	<script>
	
	
//點擊變化特效	
/* 		$("#good").toggle()(
				  function(){
					    $("#good").css("backgroundColor","#f0ad4e");
						$("#good").css("color","white");
						console.log("1")}, 
						
				  function(){
						$("#good").css("backgroundColor","white");
						$("#good").css("color","black");
						$("#good").css("border-color","black")
						console.log("2")}
				); */
		
		
	</script>

</body>
</html>

