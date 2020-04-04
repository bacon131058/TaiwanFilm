<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<head>
<title>movie</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style>
body {
	background: white;
}

.movie-content {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	background: white;
	display: inline-block;
	height: 100px;
}

.movie-content-show {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	display: inline-block;
}

.allmovieM-width {
	width: 25%;
	height: 200px;
	display: inline-block;
}

.movieUpdateWidth {
	width: 21%;
	padding: 20px;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	color: black;
}

.movieUpdateButton {
	width: 7%;
	display: inline-block;
	margin-top: 12px;
	text-align: center;
	vertical-align: top;
	padding-top: 5px;
}

.alterBtn {
	position: relative;
	top: -14px;
	right: -9px;
}

.alterBtn a:nth-child(2) {
	margin-top: 5px;
}

.movieUpdateButtonStyle {
	width: 100%;
	color: white;
	background-color: red;
	padding: 3px;
	border-radius: 3px
}
</style>
</head>
<body>
	<jsp:include page="../backstage.jsp" />

	<!-- 	<section class="container" -->
	<!-- 		style="position: absolute; left: 17%; width: 80%; padding-top: 100px"> -->
	<!-- 		<section> -->
	<!-- 			<div class="container"> -->
	<!-- 				<h1 style="text-align: center; margin: 0">編輯電影</h1> -->
	<!-- 			</div> -->
	<!-- 		</section> -->
	<!-- 		<hr -->
	<!-- 			style="height: 1px; border: none; color: #333; background-color: #333;"> -->

	<!-- 		<section class="container"> -->
	<!-- 			<fieldset class='form-horizontal'> -->
	<!-- 				<div class="form-group"> -->
	<!-- 					<h4> -->
	<!-- 						<label class="control-label col-lg-2">電影名稱</label> -->
	<!-- 					</h4> -->
	<!-- 					<h4> -->
	<!-- 						<label class="control-label col-lg-2" style="width: 40%;">英文名稱</label> -->
	<!-- 					</h4> -->
	<!-- 					<h4> -->
	<!-- 						<label class="control-label col-lg-2 col-lg-2" style="width: 20%;">上映日期 -->
	<!-- 						</label> -->
	<!-- 					</h4> -->
	<!-- 					<label class="control-label col-lg-2 col-lg-2" style="width: 8%;"> -->
	<!-- 					</label> -->
	<!-- 					<h4> -->
	<!-- 						<label class="control-label col-lg-2" style="width: 10%;">編輯</label> -->
	<!-- 					</h4> -->
	<!-- 				</div> -->
	<%-- 				<c:forEach var='movie' items='${movies }'> --%>
	<!-- 					<div class="form-group"> -->
	<!-- 						<label class="control-label col-lg-2 col-lg-2"> -->
	<%-- 							${movie.movieName} </label><label class="control-label col-lg-2 col-lg-2" --%>
	<%-- 							style="width: 40%;"> ${movie.englishName} </label> <label --%>
	<%-- 							class="control-label col-lg-2 col-lg-2" style="width: 20%;">${movie.releaseDate } --%>
	<!-- 						</label><label class="control-label col-lg-2 col-lg-2" style="width: 8%;"> -->
	<!-- 						</label> -->
	<!-- 						<div align="center" class="deleteBtn"> -->
	<!-- 							<a -->
	<%-- 								href="<spring:url value='/alterMovieDetail?id=${movie.movieId}' />" --%>
	<!-- 								class='btn btn-primary'>修改</a> <a -->
	<%-- 								href="<spring:url value='/deleteMovieDetail?id=${movie.movieId}' />" --%>
	<!-- 								class="btn btn-primary">刪除</a> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 					<br> -->
	<%-- 				</c:forEach> --%>
	<!-- 				<div class="form-group"> -->
	<!-- 					<label class="control-label col-lg-2 col-lg-2" style="width: 85%;"></label> -->
	<!-- 					<div align="center"> -->
	<%-- 						<a href="<spring:url value='/addMovie' />" class='btn btn-primary'>新增電影</a> --%>
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</fieldset> -->
	<!-- 		</section> -->
	<!-- 	</section> -->

	<section class="container"
		style="position: absolute; left: 17%; width: 80%; padding-top: 100px">
		<div class="category-content">
			<h1 style="text-align: center; margin: 0">編輯電影</h1>
			<div class="movie-content-show">
				<div class="movieUpdateWidth">電影照片</div>
				<div class="movieUpdateWidth">電影名稱</div>
				<div class="movieUpdateWidth">英文名稱</div>
				<div class="movieUpdateWidth">上映日期</div>
				<div class="movieUpdateButton">
					<div class="movieUpdateButtonStyle">編輯</div>
				</div>
			</div>
		</div>
		<c:forEach var='movie' items='${movies}'>
			<div class="movie-inner" data-number="${movie.movieId}">
				<div class="movie-content">
					<div class="movieThumb"
						style="background-image: url('${pageContext.request.contextPath}/getPicture/movieBean/${movie.movieId}');background-size:cover;height: 80px;width:20%;display: inline-block;	">
					</div>
					<div class="movieUpdateWidth" style="font-size: 18px;">${movie.movieName}</div>
					<div class="movieUpdateWidth">${movie.englishName}</div>
					<div class="movieUpdateWidth">${movie.releaseDate}</div>
					<div class="movieUpdateButton alterBtn">
						<a
							href="<spring:url value='/backstage/alterMovie?movieid=${movie.movieId}' />"
							class='btn btn-primary'>修改</a> <a
							href="<spring:url value='/backstage/deleteMovie?movieid=${movie.movieId}' />"
							class="btn btn-primary">刪除</a>
					</div>
				</div>
			</div>
		</c:forEach>
		<br> <br> <br> <br>
	</section>
</body>
<script>
	$(".movieUpdateButton a:nth-child(2)").click(function() {
		if (!confirm("確定要刪除嗎?")) {
			return false;
		}
	});
</script>
</html>