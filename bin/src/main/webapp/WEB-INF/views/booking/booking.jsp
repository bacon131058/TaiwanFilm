<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - 戲院選擇</title>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<style>
body {
	background: #f1f1f1;
}

ul {
	margin: 0;
}

ul li {
	list-style-type: none;
}

ul li i {
	position: absolute;
	left: 150px;
}

.titleImage {
	text-align: center;
}

.titleImage img {
	width: 84%;
}

.cinemaName {
	padding-left: 150px;
	text-align: left;
	diplay: inline-block;
	/* 	height: 475px; */
}

.movieSession {
	background: LightGrey;
	text-align: left;
	padding: 50px 150px 50px 150px;
}

.hiddenInfo {
	/*  	margin-top: -200px;  */
	
}

.cinemaDetail {
	font-family: Microsoft JhengHei;
	text-align: left;
	padding: 50px 150px 50px 150px;
}

.cinemaDetail iframe {
	margin-top: 25px;
}

.countryCategory {
	width: 700px;
	display: inline-block;
	vertical-align: top;
}

.countryCategory img {
	height: 180px;
	width: 300px;
}

.cinemaCountry img {
	display: inline-block;
	-webkit-filter: sepia(1);
}

.cinemaCountry section {
	padding-left: 50px;
	position: relative;
	top: -3px;
	display: inline-block;
}

#category {
	background-image: url(img/wall1.jpeg);
}
</style>
</head>
<body>

	<jsp:include page="../fragment/menu.jsp" />


	<div class="section" id="popular">
		<div class="section" id="category">
			<div class="width-limit">
				<h1 style="font-family: Microsoft JhengHei;">戲院選擇</h1>
				<div class="change-category">
					<div class="change-menu">
						<div class="buttonBorder-active buttonBorder" id="台北市">台北市</div>
						<div class="buttonBorder" id="新北市">新北市</div>
						<div class="buttonBorder" id="桃園市">桃園市</div>
						<div class="buttonBorder" id="新竹市">新竹市</div>
						<div class="buttonBorder" id="台中市">台中市</div>
						<div class="buttonBorder" id="嘉義市">嘉義市</div>
						<div class="buttonBorder" id="台南市">台南市</div>
						<div class="buttonBorder" id="高雄市">高雄市</div>
					</div>
				</div>
			</div>

			<div class="cinemaName">
				<div class="countryCategory">
					<c:forEach var='cinema' items='${cinemas }'>
						<div class="cinemaCountry ${cinema.cinemaCountry }">
							<img
								src="<c:url value='/getPicture/cinemaBean/${cinema.cinemaId }' />"
								alt="${cinema.cinemaName }" title="${cinema.cinemaName }">
							<section>
								<h3>
									<a class="cinemas" id="${cinema.cinemaId }" href="">${cinema.cinemaName }</a>
								</h3>
								<h4>服務專線&ensp;:</h4>
								<p>${cinema.cinemaPhone }</p>
								<h4>戲院地址&ensp;:</h4>
								<p>${cinema.cinemaAddress }</p>
							</section>
						</div>
					</c:forEach>
				</div>




			</div>

			<div class="hiddenInfo">
				<div class="movieSession">
					<h2>電影場次</h2>
					<span style="color: red;">*網路訂票僅開放部份座位訂票，實際剩餘座位數請洽現場售票窗口</span>&ensp;*黃色底時間代表即將售完
					/ 紅色底時間為完售
					<c:forEach var='session' items='${sessions }' varStatus='count'>
						<c:if test="${count.count % 3 == 1 }">
							<div class="sessionDetail" id="${session.cinemaId }">
								<p>${session.sessionDate.substring(0, 4) }年
									${session.sessionDate.substring(4, 6) } 月
									${session.sessionDate.substring(6, 8) } 日 ${session.sessionDay }</p>
						</c:if>
						<input type="button" style="width: 200px; height: 30px;"
							value="${session.sessionTime }"
							onclick="javascript:location.href='<spring:url value='/seatChoose?id=${session.sessionId }' />'" />
						<%-- 					<a href="<spring:url value='/seatChoose?id=${session.sessionId }' />">${session.sessionTime }</a> --%>
						<c:if test="${count.count % 3 == 0 }">
				</div>
				</c:if>
				</c:forEach>
			</div>

			<c:forEach var='cinema' items='${cinemas }'>
				<div class="cinemaDetail" id="${cinema.cinemaId }">
					<h2>戲院資訊</h2>
					<ul>
						<li><i class="fa fa-phone pr-10" style="font-size: 24px"></i>服務專線&ensp;:
							<p>${cinema.cinemaPhone }</p></li>
						<li><i class="fa fa-map-marker pr-10" style="font-size: 24px"></i>戲院地址&ensp;:
							<p>${cinema.cinemaAddress }</p></li>
						<li><i class="fa fa-bus pr-10" style="font-size: 24px"></i>交通資訊&ensp;:
							<p>-&ensp;捷運&ensp;:&ensp;${cinema.cinemaMrt }</p>
							<p>-&ensp;公車&ensp;:&ensp;${cinema.cinemaBus }</p></li>
					</ul>
					<iframe width='100%' height='270' frameborder='0' scrolling='no'
						marginheight='0' marginwidth='0'
						src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${cinema.cinemaName }&z=16&output=embed&t='></iframe>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<jsp:include page="../fragment/bottom.jsp" />
</body>

<script type="text/javascript">
	$(document).ready(function() {
		// $('.hiddenInfo').hide();
		$('.cinemaDetail').hide();
		$('.movieSession').hide();
		$('.cinemas').click(function() {
			$("html,body").animate({
				scrollTop:$(".hiddenInfo").offset().top
			}, 600);
			// 			$('.hiddenInfo').hide();
			$('.cinemaDetail').hide();
			$('.sessionDetail').hide();
			$('.movieSession').slideDown(300);
			$('[id=' + $(this).attr('id') + ']').slideDown(600);
			return false;
		});
	});

	// 	function showInfo(id){
	// 		$('.hiddenInfo').slideDown(400);
	// 		$(#id).slideDown(400);
	// 		return false;
	// 	}
	var country = ".台北市";
	$('.countryCategory div').hide();
	$(country).show();
	
	$('#台北市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#台北市').addClass("buttonBorder-active");
	});
	$('#新北市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#新北市').addClass("buttonBorder-active");
	});
	$('#桃園市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#桃園市').addClass("buttonBorder-active");
	});
	$('#新竹市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#新竹市').addClass("buttonBorder-active");
	});
	$('#台中市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#台中市').addClass("buttonBorder-active");
	});
	$('#嘉義市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#嘉義市').addClass("buttonBorder-active");
	});
	$('#台南市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#台南市').addClass("buttonBorder-active");
	});
	$('#高雄市').click(function() {
		country =  "." + $(this).attr("id");
		$('.countryCategory div').hide();
		$(country).show();
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#高雄市').addClass("buttonBorder-active");
	});
</script>
</html>