<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW"> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css"
	integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1"
	crossorigin="anonymous">
<head>
<style>
body {
	background-color: #f1f1f1;
	margin: 0
}

.TaiwanFilms {
	display: inline-block;
	font-size: 35px;
	font-weight: bold;
	color: #428bca;
	padding: 20px 5px;
}

.backStage-top {
	width: 100%;
	height: 80px;
	background: white;
	position: fixed;
	margin-top: -12px;
	z-index: 99;
	box-shadow: 0 0.25rem 0.125rem 0 rgba(0, 0, 0, 0.05);
}

.backStage-bar {
	width: 15%;
	display: inline-block;
	position: fixed;
	height: 800px;
	background: #428bca;
	top: 65px;
	left: 0px;
	border-right: 1px solid black;
	padding: 5px;
}

.backStage-title {
	width: 100%;
	color: white;
	font-weight: bold;
	background: #428bca;
	text-align: left;
	font-size: 25px;
	border-bottom: 1px solid white;
}

.choose-list {
	display: none;
	text-align: left;
}

.backStage-title div {
	width: 100%;
}

.choose-list a div {
	text-decoration: none;
	color: #1e2a3a;
}

.choose-list a {
	text-decoration: none;
	font-size: 18px;
}

.a-bar1:hover {
	background: #EA0082;
}

.a-bar2:hover {
	background: #EA0082;
}

.a-bar3:hover {
	background: #EA0082;
}

.f-bar1:hover {
	background: #EA0082;
}

.f-bar2:hover {
	background: #EA0082;
}

.f-bar3:hover {
	background: #EA0082;
}

.m-bar1:hover {
	background: #EA0082;
}

.m-bar2:hover {
	background: #EA0082;
}

.m-bar3:hover {
	background: #EA0082;
}

.s-bar1:hover {
	background: #EA0082;
}

.s-bar2:hover {
	background: #EA0082;
}

.s-bar3:hover {
	background: #EA0082;
}

.i-bar1:hover {
	background: #EA0082;
}

.i-bar2:hover {
	background: #EA0082;
}

.i-bar3:hover {
	background: #EA0082;
}

.back-member:hover {
	background: #EA0082
}

.back-funds:hover {
	background: #EA0082
}

.back-activity:hover {
	background: #EA0082
}

.back-movie:hover {
	background: #EA0082
}

.back-message:hover {
	background: #EA0082
}

.back-shopping:hover {
	background: #EA0082
}

.a-bar1 {
	height: 25px;
	color: #404040;
}

.f-bar1 {
	height: 25px;
	color: #404040;
}

.m-bar1 {
	height: 25px;
	color: #404040;
}

.s-bar1 {
	height: 25px;
	color: #404040;
}

.i-bar1 {
	height: 25px;
	color: #404040;
}
</style>
</head>
<body>

	<div class="backStage-top">
		<a href="${pageContext.request.contextPath}/">
			<div class="TaiwanFilms">TaiwanFilms</div>
		</a>
		<%-- <a href="${pageContext.request.contextPath }/backstage" style="float:right"> 
			<div class="TaiwanFilms" style="font-size: 20px;color: black;padding-top: 30px">回到後台首頁</div>
		</a>   --%>
	</div>
	<div class="backStage-bar" style="height: 870px">
		<div class="backStage-title">
			<div class="back-member backstage-title">會員</div>
			<div class="choose-list-member choose-list">
				<a href="${pageContext.request.contextPath}/ShowAllMembers">
					<div class="m-bar1">1.查詢全部會員</div>
				</a>
				<%-- 				<a href="${pageContext.request.contextPath}/FuzzyQuery"> --%>
				<!-- 					<div class="m-bar2">模糊查詢</div> -->
				<!-- 				</a> -->
				<!-- 				<a href=""> -->
				<!-- 					<div class="m-bar3">新增活動</div> -->
				<!-- 				</a>       -->

			</div>
		</div>
		<div class="backStage-title">
			<div class="back-activity backstage-title">活動</div>
			<div class="choose-list-activity choose-list">
				<a href="${pageContext.request.contextPath}/allActivityM">
					<div class="a-bar1">1.查詢全部活動</div>
				</a> <a href="${pageContext.request.contextPath}/activitiesM">
					<div class="a-bar2">2.查詢分類活動</div>
				</a> <a href="${pageContext.request.contextPath}/addActivities">
					<div class="a-bar3">3.新增活動</div>
				</a>

			</div>
		</div>
		<div class="backStage-title">
			<div class="back-funds backstage-title">募款</div>
			<div class="choose-list-funds choose-list">
				<a href="${pageContext.request.contextPath}/manage/getAllProject"><div
						class="f-bar1">1.目前的募款清單</div></a>
				<!-- 				<a href=""><div class="f-bar2">f2</div></a> -->
				<!-- 				<a href=""><div class="f-bar3">f3</div></a> -->
			</div>
		</div>
		<div class="backStage-title">
			<div class="back-movie backstage-title">電影</div>
			<div class="choose-list-movie choose-list">
				<a href="${pageContext.request.contextPath}/backstage/movie"><div class="m-bar1">1.編輯電影</div></a> <a
					href="${pageContext.request.contextPath}/backstage/addMovie"><div class="m-bar2">2.新增電影</div></a>
			</div>
		</div>
		<div class="backStage-title">
			<div class="back-shopping backstage-title">商城</div>
			<div class="choose-list-shopping choose-list">
				<a href="${pageContext.request.contextPath}/productsM">
					<div class="a-bar1">1.商品管理</div>
				</a> <a href="${pageContext.request.contextPath}/products/add"><div
						class="s-bar2">2.新增商品</div></a>
				<!-- <a href=""><div class="s-bar3">s3</div></a> -->
			</div>
		</div>
		<div class="backStage-title">
			<div class="back-message backstage-title">留言版</div>
			<div class="choose-list-message choose-list">
				<a href="${pageContext.request.contextPath}/replysB"><div
						class="i-bar1">1.被檢舉留言</div></a>
			</div>
		</div>
	</div>

	<!-- 	 style="width: 80%;display: inline-block;vertical-align:top;background:gray;height: 700px" -->
	<!-- </body> -->

	<script>
		$(".back-member").click(function() {
			$(".choose-list-member").slideToggle();
		})
		$(".back-funds").click(function() {
			$(".choose-list-funds").slideToggle();
		})
		$(".back-movie").click(function() {
			$(".choose-list-movie").slideToggle();
		})
		$(".back-shopping").click(function() {
			$(".choose-list-shopping").slideToggle();
		})
		$(".back-message").click(function() {
			$(".choose-list-message").slideToggle();
		})
		$(".back-activity").click(function() {
			$(".choose-list-activity").slideToggle();

		})
	</script>
</html>