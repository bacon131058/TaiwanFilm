<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<head>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - 網路訂票</title>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/css/seat.css"
	rel="stylesheet">
<!-- <link href="../sweetAlert/sweetalert2.css" rel="stylesheet">
	<script type="text/javascript" src="../sweetAlert/sweetalert2.js"></script> -->
<style>
i {
	margin: 0px 5px 0px 0px;
}

form {
	padding: 50px 150px 50px 150px;
}

.sidebar {
	border: solid;
	padding: 10px;
	width: 200px;
	margin: 50px 0px;
}

.informbar {
	background-color: LightGrey;
	padding: 10px 50px;
	width: 60%;
	margin: 50px 0px;
}

.rightbar {
	width: 30%;
	display: inline-block;
	vertical-align: top;
	padding-top: 100px;
}

.leftbar {
	width: 60%;
	display: inline-block;
	padding-left: 9%;
}

#select-seats-container {
	margin: 50px 0px;
}

.ticketSelect table {
	width: 71%;
	text-align: left;
	padding: 5px;
	border-collapse: collapse;
}

.ticketSelect th {
	padding-left: 5px;
	height: 40px;
	background-color: lightsteelblue;
}

.ticketSelect td {
	height: 40px;
}

.ticketSelect select {
	border-radius: 3px;
	height: 25px;
	width: 50px;
}

body{
	background-image: url(img/wall1.jpeg);
}
</style>
</head>

<body>

	<jsp:include page="../fragment/menu.jsp" />

	<form:form modelAttribute="ticketBean">
		<div class="leftbar">
			<div>
				<h1>
					<strong>${movie.movieName }</strong>
				</h1>
				<p>${movie.englishName }</p>
			</div>
			<div class="body">
				<p class="text-primary">
					<i class="fa fa-clock-o pr-10"></i>
					${session.sessionDate.substring(0, 4) }/
					${session.sessionDate.substring(4, 6) }/
					${session.sessionDate.substring(6, 8) }&emsp;${session.sessionTime }
				</p>
				<p class="text-primary">
					<i class="fa fa-location-arrow  pr-10"></i>${cinema.cinemaName }
				</p>
			</div>

			<div class="informbar">
				<h2 class="title">選擇電影票</h2>
				<p>選擇您希望購買的電影票張數和類型, 每筆交易最多可購買10張電影票</p>
			</div>

			<div class="ticketSelect">
				<table>
					<tr>
						<th>票種</th>
						<th>價格</th>
						<th>數量</th>
						<th>合計</th>
					</tr>
					<tr>
						<td><span class="spName">全票</span><br></td>
						<td>$<span id="fullPrice">290</span></td>
						<td><select id="fullQuan">
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
						</select></td>
						<td><span id="fullTotal">0</span></td>
					</tr>
					<tr>
						<td><span class="spName">優待票</span><br></td>
						<td>$<span id="couponPrice">260</span>
						</td>
						<td><select id="couponQuan">
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
						</select></td>
						<td><span id="couponTotal">0</span></td>
					</tr>

				</table>
			</div>

			<div class="informbar">
				<h2 class="title">選擇座位</h2>
				<p>選擇您希望購買的座位, 每筆交易最多可購買10張電影票</p>
			</div>

			<div id="select-seats-container">
				<div id="divLegend">
					<span class="legend-container"> <img
						src="/TaiwanFilm/img/standard_selected.png" alt="您的座位"> <span
						class="Legend">您的座位</span>
					</span> <span class="legend-container"> <img
						src="/TaiwanFilm/img/standard_available.png" alt="可選"> <span
						class="Legend">可選</span>
					</span> <span class="legend-container"> <img
						src="/TaiwanFilm/img/wheelchair_available.png" alt="輪椅座(需至影城購買)">
						<span class="Legend">輪椅座(需至影城購買)</span>
					</span> <span class="legend-container"> <img
						src="/TaiwanFilm/img/sold.png" alt="已售"> <span
						class="Legend">已售</span>
					</span>

				</div>
				<div id="divSeatMap" class="Screen-AllAreas">
					<div>
						<div id="objSeatPlan" class="Seating-Control">
							<div style="height: 275px;">
								<div class="Seating-Screen" style="width: 600px;">
									<img src="/TaiwanFilm/img/SeatScreen.png"
										style="width: 100.6061%; position: absolute; left: -1.1px;">
								</div>
								<div class="Seating-Container"
									style="width: 650px; height: 325px; visibility: visible;">
									<!-- Left Row Name Start-->
									<div
										class="Seating-RowLabelContainer Seating-RowLabelContainer-Left">
										<table style="position: absolute; top: 0%; height: 100%;"
											cellpadding="0" cellspacing="0">

											<tbody>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">A</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">B</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">C</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">D</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">E</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">F</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;"></td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">G</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">H</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">I</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">J</td>
												</tr>

											</tbody>
										</table>
									</div>
									<!-- Left Row Name End-->
									<!-- Seat Table Start-->
									<div class="Seating-Theatre"
										style="width: 600px; height: 325px;"
										data-originalsize="tableW">
										<table id="1" class="Seating-Area" data-area-number="1"
											cellspacing="0" cellpadding="0"
											style="left: 0%; top: 0%; width: 100%; height: 100%; table-layout: fixed;">
											<tbody>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="A-1" class="" data-type="Empty" data-name="A"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-2" class="" data-type="Empty" data-name="A"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-3" class="" data-type="Empty" data-name="A"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-4" class="" data-type="Empty" data-name="A"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="A-5" class="" data-type="Empty" data-name="A"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-6" class="" data-type="Empty" data-name="A"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-7" class="" data-type="Empty" data-name="A"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-8" class="" data-type="Empty" data-name="A"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-W1" class="unselectable" data-type="Special"
														data-name="A" data-col="W1" data-seatnum="13"
														data-status="4" data-areanum="1"
														data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;"></p> <img
														src="/TaiwanFilm/img/wheelchair_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="A-W2" class="unselectable" data-type="Special"
														data-name="A" data-col="W2" data-seatnum="11"
														data-status="4" data-areanum="1"
														data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;"></p> <img
														src="/TaiwanFilm/img/wheelchair_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="A-W3" class="unselectable" data-type="Special"
														data-name="A" data-col="W3" data-seatnum="9"
														data-status="4" data-areanum="1"
														data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;"></p> <img
														src="/TaiwanFilm/img/wheelchair_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-14" class="" data-type="Empty" data-name="A"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-15" class="" data-type="Empty" data-name="A"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-16" class="" data-type="Empty" data-name="A"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="A-17" class="" data-type="Empty" data-name="A"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-18" class="" data-type="Empty" data-name="A"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-19" class="" data-type="Empty" data-name="A"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="A-20" class="" data-type="Empty" data-name="A"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="11">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="B-1" class="" data-type="Empty" data-name="B"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-2" class="" data-type="Empty" data-name="B"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-3" class="" data-type="Empty" data-name="B"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-4" class="" data-type="Empty" data-name="B"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="B-5" class="" data-type="Empty" data-name="B"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-6" class="" data-type="Empty" data-name="B"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-7" class="" data-type="Empty" data-name="B"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-8" class="" data-type="Empty" data-name="B"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-9" class="" data-type="Empty" data-name="B"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-10" class="" data-type="Empty" data-name="B"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-11" class="" data-type="Empty" data-name="B"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-12" class="" data-type="Empty" data-name="B"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-13" class="" data-type="Empty" data-name="B"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-14" class="" data-type="Empty" data-name="B"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-15" class="" data-type="Empty" data-name="B"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-16" class="" data-type="Empty" data-name="B"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="B-17" class="" data-type="Empty" data-name="B"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-18" class="" data-type="Empty" data-name="B"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-19" class="" data-type="Empty" data-name="B"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="B-20" class="" data-type="Empty" data-name="B"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="10">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="C-1" class="" data-type="Empty" data-name="C"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-2" class="" data-type="Empty" data-name="C"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-3" class="" data-type="Empty" data-name="C"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-4" class="" data-type="Empty" data-name="C"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="C-5" class="" data-type="Empty" data-name="C"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-6" class="" data-type="Empty" data-name="C"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-7" class="" data-type="Empty" data-name="C"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-8" class="" data-type="Empty" data-name="C"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-9" class="" data-type="Empty" data-name="C"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-10" class="" data-type="Empty" data-name="C"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-11" class="" data-type="Empty" data-name="C"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-12" class="" data-type="Empty" data-name="C"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-13" class="" data-type="Empty" data-name="C"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-14" class="" data-type="Empty" data-name="C"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-15" class="" data-type="Empty" data-name="C"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-16" class="" data-type="Empty" data-name="C"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="C-17" class="" data-type="Empty" data-name="C"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-18" class="" data-type="Empty" data-name="C"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-19" class="" data-type="Empty" data-name="C"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="C-20" class="" data-type="Empty" data-name="C"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="9">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="D-1" class="" data-type="Empty" data-name="D"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-2" class="" data-type="Empty" data-name="D"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-3" class="" data-type="Empty" data-name="D"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-4" class="" data-type="Empty" data-name="D"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="D-5" class="" data-type="Empty" data-name="D"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-6" class="" data-type="Empty" data-name="D"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-7" class="" data-type="Empty" data-name="D"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-8" class="" data-type="Empty" data-name="D"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-9" class="" data-type="Empty" data-name="D"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-10" class="" data-type="Empty" data-name="D"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-11" class="" data-type="Empty" data-name="D"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-12" class="" data-type="Empty" data-name="D"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-13" class="" data-type="Empty" data-name="D"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-14" class="" data-type="Empty" data-name="D"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-15" class="" data-type="Empty" data-name="D"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-16" class="" data-type="Empty" data-name="D"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="D-17" class="" data-type="Empty" data-name="D"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-18" class="" data-type="Empty" data-name="D"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-19" class="" data-type="Empty" data-name="D"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="D-20" class="" data-type="Empty" data-name="D"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="8">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="E-1" class="" data-type="Empty" data-name="E"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-2" class="" data-type="Empty" data-name="E"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-3" class="" data-type="Empty" data-name="E"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-4" class="" data-type="Empty" data-name="E"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="E-5" class="" data-type="Empty" data-name="E"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-6" class="" data-type="Empty" data-name="E"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-7" class="" data-type="Empty" data-name="E"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-8" class="" data-type="Empty" data-name="E"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-9" class="" data-type="Empty" data-name="E"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-10" class="" data-type="Empty" data-name="E"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-11" class="" data-type="Empty" data-name="E"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-12" class="" data-type="Empty" data-name="E"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-13" class="" data-type="Empty" data-name="E"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-14" class="" data-type="Empty" data-name="E"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-15" class="" data-type="Empty" data-name="E"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-16" class="" data-type="Empty" data-name="E"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="E-17" class="" data-type="Empty" data-name="E"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-18" class="" data-type="Empty" data-name="E"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-19" class="" data-type="Empty" data-name="E"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="E-20" class="" data-type="Empty" data-name="E"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="7">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="F-1" class="" data-type="Empty" data-name="F"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-2" class="" data-type="Empty" data-name="F"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-3" class="" data-type="Empty" data-name="F"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-4" class="" data-type="Empty" data-name="F"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="F-5" class="" data-type="Empty" data-name="F"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-6" class="" data-type="Empty" data-name="F"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-7" class="" data-type="Empty" data-name="F"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-8" class="" data-type="Empty" data-name="F"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-9" class="" data-type="Empty" data-name="F"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-10" class="" data-type="Empty" data-name="F"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-11" class="" data-type="Empty" data-name="F"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-12" class="" data-type="Empty" data-name="F"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-13" class="" data-type="Empty" data-name="F"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-14" class="" data-type="Empty" data-name="F"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-15" class="" data-type="Empty" data-name="F"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-16" class="" data-type="Empty" data-name="F"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="F-17" class="" data-type="Empty" data-name="F"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-18" class="" data-type="Empty" data-name="F"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-19" class="" data-type="Empty" data-name="F"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="F-20" class="" data-type="Empty" data-name="F"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="6">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>


												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="G-1" class="" data-type="Empty" data-name="G"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-2" class="" data-type="Empty" data-name="G"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-3" class="" data-type="Empty" data-name="G"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-4" class="" data-type="Empty" data-name="G"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="G-5" class="" data-type="Empty" data-name="G"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-6" class="" data-type="Empty" data-name="G"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-7" class="" data-type="Empty" data-name="G"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-8" class="" data-type="Empty" data-name="G"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-9" class="" data-type="Empty" data-name="G"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-10" class="" data-type="Empty" data-name="G"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-11" class="" data-type="Empty" data-name="G"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-12" class="" data-type="Empty" data-name="G"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-13" class="" data-type="Empty" data-name="G"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-14" class="" data-type="Empty" data-name="G"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-15" class="" data-type="Empty" data-name="G"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-16" class="" data-type="Empty" data-name="G"
														data-col="16" data-seatnum="6" data-status="5"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="G-17" class="" data-type="Empty" data-name="G"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-18" class="" data-type="Empty" data-name="G"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-19" class="" data-type="Empty" data-name="G"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="G-20" class="" data-type="Empty" data-name="G"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="4">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="H-1" class="" data-type="Empty" data-name="H"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-2" class="" data-type="Empty" data-name="H"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-3" class="" data-type="Empty" data-name="H"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-4" class="" data-type="Empty" data-name="H"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="H-5" class="" data-type="Empty" data-name="H"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-6" class="" data-type="Empty" data-name="H"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-7" class="" data-type="Empty" data-name="H"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-8" class="" data-type="Empty" data-name="H"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-9" class="" data-type="Empty" data-name="H"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-10" class="" data-type="Empty" data-name="H"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-11" class="" data-type="Empty" data-name="H"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-12" class="" data-type="Empty" data-name="H"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-13" class="" data-type="Empty" data-name="H"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-14" class="" data-type="Empty" data-name="H"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-15" class="" data-type="Empty" data-name="H"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-16" class="" data-type="Empty" data-name="H"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="H-17" class="" data-type="Empty" data-name="H"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-18" class="" data-type="Empty" data-name="H"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-19" class="" data-type="Empty" data-name="H"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="H-20" class="" data-type="Empty" data-name="H"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="3">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="I-1" class="" data-type="Empty" data-name="I"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-2" class="" data-type="Empty" data-name="I"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-3" class="" data-type="Empty" data-name="I"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-4" class="" data-type="Empty" data-name="I"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="I-5" class="" data-type="Empty" data-name="I"
														data-col="5" data-seatnum="17" data-status="3"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-6" class="" data-type="Empty" data-name="I"
														data-col="6" data-seatnum="16" data-status="3"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-7" class="" data-type="Empty" data-name="I"
														data-col="7" data-seatnum="15" data-status="3"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-8" class="" data-type="Empty" data-name="I"
														data-col="8" data-seatnum="14" data-status="3"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-9" class="" data-type="Empty" data-name="I"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-10" class="" data-type="Empty" data-name="I"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-11" class="" data-type="Empty" data-name="I"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-12" class="" data-type="Empty" data-name="I"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-13" class="" data-type="Empty" data-name="I"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-14" class="" data-type="Empty" data-name="I"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-15" class="" data-type="Empty" data-name="I"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-16" class="" data-type="Empty" data-name="I"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="I-17" class="" data-type="Empty" data-name="I"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-18" class="" data-type="Empty" data-name="I"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-19" class="" data-type="Empty" data-name="I"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="I-20" class="" data-type="Empty" data-name="I"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="2">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>
												<tr style="line-height: 25px;">
													<td></td>

													<td id="J-1" class="" data-type="Empty" data-name="J"
														data-col="1" data-seatnum="22" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">1</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-2" class="" data-type="Empty" data-name="J"
														data-col="2" data-seatnum="21" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">2</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-3" class="" data-type="Empty" data-name="J"
														data-col="3" data-seatnum="20" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">3</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-4" class="" data-type="Empty" data-name="J"
														data-col="4" data-seatnum="19" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">4</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="J-5" class="" data-type="Empty" data-name="J"
														data-col="5" data-seatnum="17" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">5</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-6" class="" data-type="Empty" data-name="J"
														data-col="6" data-seatnum="16" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">6</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-7" class="" data-type="Empty" data-name="J"
														data-col="7" data-seatnum="15" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">7</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-8" class="" data-type="Empty" data-name="J"
														data-col="8" data-seatnum="14" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">8</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-9" class="" data-type="Empty" data-name="J"
														data-col="9" data-seatnum="13" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">9</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-10" class="" data-type="Empty" data-name="J"
														data-col="10" data-seatnum="12" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">10</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-11" class="" data-type="Empty" data-name="J"
														data-col="11" data-seatnum="11" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">11</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-12" class="" data-type="Empty" data-name="J"
														data-col="12" data-seatnum="10" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">12</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-13" class="" data-type="Empty" data-name="J"
														data-col="13" data-seatnum="9" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">13</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-14" class="" data-type="Empty" data-name="J"
														data-col="14" data-seatnum="8" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">14</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-15" class="" data-type="Empty" data-name="J"
														data-col="15" data-seatnum="7" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">15</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-16" class="" data-type="Empty" data-name="J"
														data-col="16" data-seatnum="6" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">16</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>
													<td id="J-17" class="" data-type="Empty" data-name="J"
														data-col="17" data-seatnum="4" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">17</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-18" class="" data-type="Empty" data-name="J"
														data-col="18" data-seatnum="3" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">18</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-19" class="" data-type="Empty" data-name="J"
														data-col="19" data-seatnum="2" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">19</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td id="J-20" class="" data-type="Empty" data-name="J"
														data-col="20" data-seatnum="1" data-status="0"
														data-areanum="1" data-areacode="0000000001" data-row="1">
														<p style="line-height: 25px; width: 25px;">20</p> <img
														src="/TaiwanFilm/img/standard_available.png"
														style="width: 25px; height: 25px;">
													</td>
													<td></td>

												</tr>

											</tbody>
										</table>
									</div>
									<!-- Seat Table End-->
									<!-- Right Row Name Start-->
									<div
										class="Seating-RowLabelContainer Seating-RowLabelContainer-Right">
										<table style="position: absolute; top: 0%; height: 100%;"
											cellpadding="0" cellspacing="0">
											<tbody>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">A</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">B</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">C</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">D</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">E</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">F</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;"></td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">G</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">H</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">I</td>
												</tr>
												<tr style="line-height: 25px;">
													<td style="background-color: white;">J</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- Right Row Name End-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="rightbar">
			<div class="sidebar">
				<div class="block clearfix">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<i class="fa fa-clock-o pr-10"></i>時間剩餘<label class="panel-body"
									id="divCountDown"> <span id="clock">10:00</span>
								</label>
							</h4>
						</div>
					</div>
				</div>
			</div>


			<div class="sidebar">
				<div class="panel-heading">
					<h4 class="panel-title">
						<i class="fa fa-ticket pr-10"></i>購物清單
					</h4>
					<hr>
				</div>
				<table>
					<tr id="OrderItemHO000000850367">
						<td>
							<p>全票</p>
							<p id="fullTicket">X &nbsp;0&nbsp; = &nbsp; 0</p>
						</td>
					</tr>
					<tr id="OrderItemHO000000850367">
						<td>
							<p>優待票</p>
							<p id="couponTicket">X &nbsp;0&nbsp; = &nbsp; 0</p>
						</td>
					</tr>
				</table>

				<hr>
				<p>
					合計 <span id="totalPrice">0</span>
				</p>

			</div>

			<form:input path="sessionId" type="hidden"
				value="${session.sessionId }" />
			<br>
			<form:input path="seat" id="seatLocation" type="hidden" />
			<input id="submitBtn" type="submit" value="結帳"
				style="width: 200px; height: 30px;" disabled />

		</div>
	</form:form>
	
	<jsp:include page="../fragment/bottom.jsp" />
</body>
<script>
	var fullStr = 0;
	var couponStr = 0;
	var fullQuan = 0; //選座位時用
	var couponQuan = 0;

	$('#fullQuan').change(function() {
		$('#submitBtn').attr('disabled', true); //數量不對不能按結帳
		fullStr = $('#fullPrice').text();
		fullQuan = parseInt(this.value);
		if (fullQuan + couponQuan > 10) { //超過十張歸零
			$('#fullQuan').get(0).selectedIndex = 0;
			fullQuan = 0;
			alert("每筆交易最多可購買10張電影票!!");
		}
		fullStr = fullStr * this.value;
		var str = "X  " + this.value + "  =   " + fullStr;
		$("#fullTotal").text(fullStr); //左邊合計動態更新
		$("#fullTicket").text(str); //右邊購物清單動態更新
		$("#totalPrice").text(fullStr + couponStr);
	})

	$('#couponQuan').change(function() {
		$('#submitBtn').attr('disabled', true);
		couponStr = $('#couponPrice').text();
		couponQuan = parseInt(this.value);
		if (fullQuan + couponQuan > 10) {
			$('#couponQuan').get(0).selectedIndex = 0;
			couponQuan = 0;
			alert("每筆交易最多可購買10張電影票!!");
		}
		couponStr = couponStr * this.value;
		var str = "X  " + this.value + "  =   " + couponStr;
		$("#couponTotal").text(couponStr);
		$("#couponTicket").text(str);
		$("#totalPrice").text(fullStr + couponStr);
	})

	var time = 10 * 60; //跳轉秒數
	setInterval(function() {
		time--;
		var m = Math.floor((time % 3600) / (60));
		var s = Math.floor(time % 60);
		$('#clock').text(s < 10 ? "0" + m + ":0" + s : "0" + m + ":" + s);
		if (time == 0) {
			location.href = '/TaiwanFilm'; //跳轉位置
		}
	}, 1000);

	var soldstr = "<c:forEach var='ticket' items='${tickets }' varStatus='status'>${ticket.seat }<c:if test='${!status.last }'>,</c:if></c:forEach>";
	var SoldSeats = soldstr.split(","); //切割字串以逗號隔開
	for (var i = 0; i < SoldSeats.length; i++) {
		$("#" + SoldSeats[i]).find("img").attr("src",
				"/TaiwanFilm/img/sold.png");
		$("#" + SoldSeats[i]).attr("data-type", "Sold");
	}
	$("td[data-type='Sold']").click(function() {
		if (fullQuan + couponQuan != 0) {
			alert("提醒您此座位不可選");
		}
	});

	var SelectSeats = [];
	$("td[data-type='Empty']").click(
			function() {
				if (SelectSeats.indexOf($(this).attr("id")) > 0) { //已選
					return false;
				}
				if (SelectSeats.length == (fullQuan + couponQuan)) {
					$("#" + SelectSeats[0]).find("img").attr("src",
							"/TaiwanFilm/img/standard_available.png");
					SelectSeats.splice(0, 1); //刪掉第一個
				}
				if (SelectSeats.length > (fullQuan + couponQuan)) { //購買數量小於已選位置數
					for (var i = 0; i < SelectSeats.length; i++) {
						$("#" + SelectSeats[i]).find("img").attr("src",
								"/TaiwanFilm/img/standard_available.png");
					}
					SelectSeats.splice(0, (fullQuan + couponQuan)); //刪掉全部
					alert("請重新選位!!");
					// swal("提醒您", "請重新選位!!", "error");
				} else {
					if (fullQuan + couponQuan != 0) {
						SelectSeats.push($(this).attr("id"));
						$(this).find("img").attr("src",
								"/TaiwanFilm/img/standard_selected.png");
						$("#seatLocation").val(SelectSeats);
						if (SelectSeats.length == (fullQuan + couponQuan)) { //條件達成才可submit
							$('#submitBtn').attr('disabled', false);
						}
					}
				}
			});

	$("#submitBtn").click(function() {
		if (!confirm("確定要結帳嗎? 結帳後無法變更購買資訊")) {
			return false;
		}
	});
</script>

</html>