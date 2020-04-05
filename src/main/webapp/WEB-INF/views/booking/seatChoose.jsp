<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/movie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/menuStyle.css">
<link href="${pageContext.request.contextPath }/css/seat.css" rel="stylesheet">
<!-- <link href="../sweetAlert/sweetalert2.css" rel="stylesheet"> -->
<!-- <script type="text/javascript" src="../sweetAlert/sweetalert2.js"></script> -->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - 網路訂票</title>
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

body {
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
					<strong>${session.movieBean.movieName }</strong>
				</h1>
				<p>${session.movieBean.englishName }</p>
			</div>
			<div class="body">
				<p class="text-primary">
					<i class="fa fa-calendar pr-10"></i>
					${session.sessionDate.substring(0, 4) }/
					${session.sessionDate.substring(4, 6) }/
					${session.sessionDate.substring(6, 8) }&emsp;${session.sessionTime }
				</p>
				<p class="text-primary">
					<i class="fa fa-location-arrow pr-10"></i>${session.cinemaBean.cinemaName }
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
						<td>$<span id="fullPrice">${session.movieBean.ticketPrice }</span></td>
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
						<td>$<span id="couponPrice">${session.movieBean.ticketPrice < 30 ? 0 : session.movieBean.ticketPrice - 30 }</span>
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

									<!-- Seat Alphabet -->
									<c:set var="alphabet">A,B,C,D,E,F, ,G,H,I,Z</c:set>
									<!-- Left Row Name Start-->
									<div
										class="Seating-RowLabelContainer Seating-RowLabelContainer-Left">
										<table style="position: absolute; top: 0%; height: 100%;"
											cellpadding="0" cellspacing="0">
											<tbody>
												<c:forTokens items="${alphabet}" delims="," var="letter">
													<tr style="line-height: 25px;">
														<td style="background-color: white;">${letter}</td>
													</tr>
												</c:forTokens>
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
												<c:forTokens items="${alphabet}" delims="," var="letter">
													<tr style="line-height: 25px;">
														<td></td>
														<c:forEach var="i" begin="1" end="20">
															<c:choose>
																<c:when test="${letter.equals(' ') }">
																	<td></td>
																</c:when>
																<c:when
																	test="${letter.equals('A') && (i == 10 || i == 12) }">
																	<td></td>
																</c:when>
																<c:when
																	test="${letter.equals('A') && (i == 9 || i == 11 || i == 13) }">
																	<td id="${letter }-W" class="unselectable"
																		data-type="Special">
																		<p style="line-height: 25px; width: 25px;"></p> <img
																		src="/TaiwanFilm/img/wheelchair_available.png"
																		style="width: 25px; height: 25px;">
																	</td>
																</c:when>
																<c:when test="${i == 5 || i == 17 }">
																	<td></td>
																	<td id="${letter }-${i }" class="" data-type="Empty">
																		<p style="line-height: 25px; width: 25px;">${i }</p> <img
																		src="/TaiwanFilm/img/standard_available.png"
																		style="width: 25px; height: 25px;">
																	</td>
																</c:when>
																<c:otherwise>
																	<td id="${letter}-${i}" class="" data-type="Empty">
																		<p style="line-height: 25px; width: 25px;">${i}</p> <img
																		src="/TaiwanFilm/img/standard_available.png"
																		style="width: 25px; height: 25px;">
																	</td>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<td></td>
													</tr>
												</c:forTokens>
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
												<c:forTokens items="${alphabet}" delims="," var="letter">
													<tr style="line-height: 25px;">
														<td style="background-color: white;">${letter}</td>
													</tr>
												</c:forTokens>
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
						<i class="fa fa-shopping-cart pr-10"></i>購物清單
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

			<%-- 			<form:input path="sessionBean" type="hidden" --%>
			<%-- 				value="${session }" /> --%>
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
					SelectSeats = []; //刪掉全部
					$("#seatLocation").val(SelectSeats);
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