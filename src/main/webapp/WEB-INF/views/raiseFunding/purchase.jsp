<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/UtilTool.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/purchase1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>	

</head>

<body>
	<jsp:include page="../fragment/menu.jsp" />
	<div class="purchaseWrapper">
		<div class="purchaseContainer">
			<h1>${dpBean.projBean.projectName}</h1>
			<p>
				日期<span class="LocaleDate"></span>
			</p>
			<section class="DataSection">
				<div class="buyerData">
					<form:form method="post" modelAttribute="PurchaseBean"
						action="${pageContext.request.contextPath}/newPurchase">
						<span class="bluequote">寄送區域</span>
						<br>
						<form:select path="buyerLocation" id="buyerLocation">
							<form:option value="InTaiwan">台灣本島</form:option>
							<form:option value="OutOfTaiwan">外島地區</form:option>
							<form:option value="Foreign">國外區域</form:option>
						</form:select>
						<br>
						<span class="bluequote">寄送資訊</span>
						<span>以下為贊助人聯絡資訊，請確實填寫</span>
						<div class="form-group">
							<div class="input-group topic">收件人姓名</div>
							<div class="input-group textIn">
								<form:input  id="buyerName" path="buyerName" />
							</div>
							<br>
							<div class="input-group topic">郵遞區號</div>
							<div class="input-group textIn">
								<form:input id="postNumber" path="postNumber" />
							</div>
							<br>
							<div class="input-group topic">收件地址</div>
							<div class="input-group textIn">
								<form:input id="adress" path="adress" />
							</div>
							<br>
							<div class="input-group topic">連絡電話</div>
							<div class="input-group textIn">
								<form:input id="phone" path="phone" />
							</div>
							<br>
							<div class="input-group topic">聯絡信箱</div>
							<div class="input-group textIn">
								<form:input id="email" path="email" />
							</div>
							<br>
							<div class="input-group topic">備註</div>
							<div class="input-group textIn">
								<form:input  id="note" path="note" />
							</div>
							<br>
						</div>
						<p class="bluequote">付款方式</p>
						<div>
							<img
								src="${pageContext.request.contextPath}/img/supermark/familymart.png">
							<img
								src="${pageContext.request.contextPath}/img/supermark/ipon.png">
							<img
								src="${pageContext.request.contextPath}/img/supermark/life.png">
							<img
								src="${pageContext.request.contextPath}/img/supermark/ok.png">
						</div>
						<p class="bluequote">贊助金額</p>
						<div class="whiteWell confirmData">
							<div class="rewardData">
								<div class="col-left-02">
									<small>贊助金額</small>
									<p>
										<span class="dollar1" id="donateMoney">${dpBean.donateMoney}</span>元
									</p>
								</div>
								<div class="col-middle-01">
									<small>運費</small>
									<p>
										<span class="fare dollar1">60</span>元
									</p>
								</div>
								<div class="col-right-02">
									<small>總金額</small>
									<p>
										<span class="payAmount dollar1">${dpBean.donateMoney}</span>元
									</p>

								</div>
							</div>
						</div>
						<input type="hidden" name="payAmount" id="payAmount" value="">
						<input type="hidden" name="localeDate" id="localeDate" value="">
						<form:checkbox path="incognito" />匿名贊助
                        <input type="hidden" name="planId"
							value="${dpBean.planId}">
						<input type="submit" value="進行付款">	<button id="touch" type="button" onclick="oneTouch()">oneTouch</button>
					</form:form>
				</div>
				<div class="choosenData">
					<div class="plan" id="donatePlan${dpBean.planId}">
						<div>
							<h2 class="donateMoney dollar">${dpBean.donateMoney}</h2>
						</div>
						<div class="projectThumb">
							<img
								src="${pageContext.request.contextPath}/getDonatePlan/photo/${dpBean.planId}">
						</div>
						<div class="planText">
							<div class="description">
								<c:out value="${dpBean.donateDescription}"
									default="單純贊助，不需回饋，小額贊助給予劇組鼓勵和支持。"></c:out>
							</div>
							<span class="shipping" data-shipping="${dpBean.shipping}">沒有運送服務</span>
							<span class="deliverDate">預計寄送時間 ${dpBean.dliverDate}</span> <span
								class="limit">限量 <strong>${dpBean.limitNum}</strong>份
							</span>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<jsp:include page="../fragment/footer.jsp" />
	<script>
		$(function() {
			var firstPrice = Number($("#donateMoney").text()) + Number($(".fare").text());
			$(".payAmount").text(firstPrice);
			$(".dollar").text(function(){
				$(this).text("$"+formatNumber($(this).text())) ;
			})
			$(".dollar1").text(function(){
						$(this).text(formatNumber($(this).text())) ;
					})
			var date = new Date().toLocaleDateString();
			$(".LocaleDate").text(date);
			$("#localeDate").val(date);
			var intputPay = $(".payAmount").text().replace(",","");
			console.log("first ready"+intputPay);
			$("#payAmount").val(intputPay);
			
			
		});

		$("#buyerLocation").change(
				function() {
					var position = $("#buyerLocation").val();
					switch (position) {
					case "InTaiwan":
						$(".fare").text("60");
						var price = Number($("#donateMoney").text().replace(",",""))
								+ Number($(".fare").text());
						$(".payAmount").text(price);
						break;
					case "OutOfTaiwan":
						$(".fare").text("100");
						var price = Number($("#donateMoney").text().replace(",",""))
								+ Number($(".fare").text());
						$(".payAmount").text(price);
						break;
					case "Foreign":
						$(".fare").text("200");
						var price = Number($("#donateMoney").text().replace(",",""))
								+ Number($(".fare").text());
						$(".payAmount").text(price);
						break;
					}
					console.log($(".payAmount").text());
					var intputPay = $(".payAmount").text().replace(",","");
					console.log(intputPay);
					$("#payAmount").val(intputPay);
					$(".dollar1").text(function(){
						alert($(".payAmount").text())
						if($(this).text().indexOf(",")==-1)
						$(this).text(formatNumber($(this).text())) ;
// 						else $(this).text(formatNumber($(this).text().replace(",",""))) ;
					})
				
				})
				
				
		function oneTouch(){
			$("#buyerName").val("大安金城武");
			$("#postNumber").val("10667");
			$("#adress").val("106台北市大安區復興南路一段390號2樓");
			$("#phone").val("02 6631 6666");
			$("#email").val("eeit110@gmail.com");
			$("#note").val("上課買不到口罩，寄一點3Q");
		}
	</script>
</body>

</html>