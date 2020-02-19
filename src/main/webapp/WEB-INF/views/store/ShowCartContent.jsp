<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server 
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance 
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css">
<style>
.whole {
	text-align: center;
	width: 100%
}

.ball-area {
	width: 80%;
	display: inline-block
}

.number {
	position: relative;
	padding-top: 7px;
	color: white;
	font-weight: bold;
}

.Process {
	width: 100%;
}

.Process-area {
	text-align: center;
	width: 100%;
	display: inline-block;
}

.ball1 {
	width: 70px;
	height: 40px;
	display: inline-block;
	font-size: 14px;
}

.ball2 {
	width: 270px;
	display: inline-block;
}

.ball-area1 {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #cccccc;
	display: inline-block
}

.ball-area2 {
	width: 300px;
	height: 5px;
	background: #e9ebec;
	display: inline-block;
}

.area {
	width: 80%;
	display: inline-block;
	text-align: center
}

.process1 {
	background: #9c9c90;
}

.shopping {
	text-align: center;
	display: inline-block;
	width: 80%;
	background: #f6f6f6;
}

.shopping-title {
	text-align: left;
	padding: 20px;
	font-size: 20px;
}

.content {
	width: 100%;
	background: white;
	padding: 10px 0px;
	display: inline-block;
}

.content-area {
	width: 13%;
	display: inline-block;
	padding-top: 15px;
	text-align: center
}

.Information {
	width: 15%;
	text-align: left;
}

.img {
	width: 100%;
	display: inline-block;
	margin-left: -17px;
}

.desc {
	width: 65%;
	display: inline-block;
}

.ball-area {
	width: 80%;
	text-align: center;
}

.ball {
	width: 50px;
	height: 50px;
	margin: 0px 50px;
	border-radius: 50%;
	display: inline-block;
	background: red;
}
</style>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem?cmd=DEL&bookId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}

	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem?cmd=MOD&bookId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		document.forms[0].action="<spring:url value='checkout' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		document.forms[0].action="<spring:url value='clearCart' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
		return true;
	} else {
		return false;
	}
}
</script>

<meta charset="UTF-8">
<title>購物清單</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>

	<c:set var="funcName" value="CHE" scope="session" />
	<jsp:include page="../fragment/menu.jsp" />



	<c:choose>
		<c:when test="${ShoppingCart.subtotal > 0}">
			<c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
			<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
		</c:when>
		<c:otherwise>
			<c:set var="subtotalMessage" value="金額小計:  0 元" />
			<c:set var="subtotal" value="0" />
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%-- 	<table
		style="margin: 0 auto; margin-top: 100px; width: 820px; border: 0.5px solid #d1d1d1; text-align: center;">
		<tr>
			<td colspan='4'>
				<!--          購物車的標題          -->
				<table style="width: 820px">
					<tr height='40'>
						<td width="270">&nbsp;</td>
						<td width="280" align='center'><FONT size='+2'>${AppName}</FONT></td>
						<td width="270" align='right'></td>
					</tr>
					<tr height='18'>
						<td width="270">&nbsp;</td>
						<td width="280" align='center'><FONT size='+2'>購 物 清 單</FONT></td>
						<td width="270" align='right'></td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td>
				<table>

					<tr style="background-color: #f54387; color: #eaedf3;">
						<th width="320">商品名稱</th>
						<!-- <th width="70">作者</th> -->
						<th width="150">廠商名稱</th>
						<th width="80">單價</th>
						<th width="50">數量</th>
						<th width="70">可賣量</th>
						<th width="110">小計</th>
						<th width="80">&nbsp;</th>
					</tr>
					<c:forEach varStatus="vs" var="anEntry"
						items="${ShoppingCart.content}">
						<tr height='16'>
							<td>${anEntry.value.title}</td>
							<td style="text-align: center;">${fn:substring(anEntry.value.author, 0, 3)}</td>
							<td style="text-align: center;">${fn:substring(anEntry.value.companyName, 0,10)}</td>
							<td style="text-align: center;"><fmt:formatNumber
									value="${anEntry.value.unitPrice * 1 }" pattern="#,###" />元</td>
							<td style="text-align: center;">
								<Input class='selectQty' id="newQty${vs.index}" style="width: 28px; text-align: right; dispaly:none; "
							 name="newQty" type="text"
								value="<fmt:formatNumber value="${anEntry.value.quantity}" />"
								name="qty"  />  <div style="display:none;" id="newQty2${vs.index}" class="selectQty"  >${anEntry.value.quantity}</div>

								<select class="selectQty" id="newQty${vs.index}"
								style="width: 40px; text-align: right" name='newQty' name="qty"
								onkeypress="return isNumberKey(event)">


									<c:forEach begin="1" end="${anEntry.value.stock}" var="i">
										<option class="buyQty" style="display: none;"
											value="<fmt:formatNumber value="${anEntry.value.quantity}" />">${anEntry.value.quantity}</option>
										<option value="${i}">${i}</option>

									</c:forEach>


									<option style="display: none;"
										value="<fmt:formatNumber value="${anEntry.value.quantity}" />">${anEntry.value.quantity}</option>
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

							</select>

							</td>
							<td style="text-align: center;" value="${anEntry.value.stock}">${anEntry.value.stock}</td>
							<td style="text-align: center;"><fmt:formatNumber
									value="${anEntry.value.unitPrice * anEntry.value.quantity}"
									pattern="#,###,###" />元</td>

							<td><Input style="display: none" id='modfy${vs.index}'
								type="button" name="update" value="修改"
								onclick="modify(${anEntry.key}, ${anEntry.value.quantity}, ${vs.index})">

								<Input type="button" name="delete" value="取消"
								onclick="confirmDelete(${anEntry.key})"></td>
						</tr>
					</c:forEach>
					<tr height='16'>
						<td colspan='6' align='right'>總金額：</td>
						<td align='right'><fmt:formatNumber value="${subtotal}"
								pattern="#,###,###" />元</td>
						<!-- <td align='right'>&nbsp;</td> -->
					</tr>
					<tr>
						<td colspan='5' align='right'>營業稅：</td>
						<c:set var="VAT" value="${subtotal*0.05 + 0.0001}" />
						<td align='right'><fmt:formatNumber value="${VAT}"
								pattern="#,###,###" />元</td>
						<!-- <td align='right'>&nbsp;</td> -->
					</tr>
					<tr>
						<td colspan='5' align='right'>總計金額：</td>
						<td align='right'><fmt:formatNumber
								value="${subtotal + VAT }" pattern="#,###,###" />元</td>
						<!-- <td align='right'>&nbsp;</td> -->
					</tr>
				</table>

			</td>
		</tr>
		<tr height='80'>
			<td>
				<table>
					<tr>
						<td width="265" align='center'><a
							style="cursor: pointer; color: black; text-decoration: none"
							href="<c:url value='products' />">返回商城</a></td>
						<td width="265" align='center'><a style="cursor: pointer;"
							onClick="return Checkout(${subtotal});">結帳去</a></td>
						<td width="265" align='center'><a style="cursor: pointer;"
							onClick="return Abort();">清空購物車</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div style='text-align: center;'>
		<c:if test='${not empty OrderErrorMessage}'>
			<font color='red'>${OrderErrorMessage}</font>
			<c:remove var="OrderErrorMessage" />
		</c:if>
	</div>

	<form>
		<input type="hidden" name="a" />
	</form> --%>

	<div class="whole">
		<div class="ball-area">
			<div class="Process">
				<div class="Process-area">
					<div class="ball-area1  process1">
						<div class="number">1</div>
					</div>
					<div class="ball-area2"></div>
					<div class="ball-area1  process2">
						<div class="number">2</div>
					</div>
					<div class="ball-area2"></div>
					<div class="ball-area1  process3">
						<div class="number">3</div>
					</div>
				</div>
			</div>
			<div class="Process">
				<div class="Process-area">
					<div class="ball1">購物車</div>
					<div class="ball2"></div>
					<div class="ball1">填寫資料</div>
					<div class="ball2"></div>
					<div class="ball1">訂單確認</div>
				</div>
			</div>
		</div>
		<div class="shopping">
			<div class="shopping-title">
				購物車( 
				<div style="display: inline-block;" id="showCartNum"></div>
				 件)
			</div>
			<div style="width: 100%">
				<div class="content" style="border-bottom: 1px solid black">
					<div class="content-area Information">商品資訊</div>
					<div class="content-area">廠商</div>
					<div class="content-area">單價</div>
					<div class="content-area">數量</div>
					<div class="content-area">可賣量</div>
					<div class="content-area">小計</div>
					<div class="content-area"></div>
				</div>

				<!--  寫foreach -->
				<c:forEach varStatus="vs" var="anEntry"
					items="${ShoppingCart.content}">
					<div class="content">
						<div class="content-area Information">
							<div class="img">${anEntry.value.title}</div>
							<!-- <div class="desc"></div> -->
						</div>
						<div class="content-area">${fn:substring(anEntry.value.companyName, 0,10)}</div>
						<div class="content-area">${anEntry.value.unitPrice * 1 }</div>
						<div class="content-area">
							<select class="selectQty" id="newQty${vs.index}"
								style="width: 40px; text-align: right" name='newQty' name="qty"
								onkeypress="return isNumberKey(event)">


								<c:forEach begin="1" end="${anEntry.value.stock}" var="i">
									<option class="buyQty" style="display: none;"
										value="<fmt:formatNumber value="${anEntry.value.quantity}" />">${anEntry.value.quantity}</option>
									<option value="${i}">${i}</option>

								</c:forEach>
							</select>
						</div>
						<div class="content-area">${anEntry.value.stock}</div>
						<div class="content-area">${anEntry.value.unitPrice * anEntry.value.quantity}</div>
						<div class="content-area" style="width: 12%;">
							<Input style="display: none" id='modfy${vs.index}' type="button"
								name="update" value="修改"
								onclick="modify(${anEntry.key}, ${anEntry.value.quantity}, ${vs.index})">

							<Input type="button" name="delete" value="取消"
								style="font-size: 17px; border-radius: 10%; background: lightcoral;"
								onclick="confirmDelete(${anEntry.key})">
						</div>
					</div>
				</c:forEach>

				<div height='16'>

					<div align='right'
						style="padding-bottom: 21px;; background: #fdfffd; text-align: end; padding-right: 211px; height: 20px; margin-top: 10p; padding-top: 17px; color: red;">
						總金額：
						<fmt:formatNumber value="${subtotal}" pattern="#,###,###" />
						元
					</div>
					<!-- <td align='right'>&nbsp;</td> -->
				</div>
				<div style='text-align: left; padding: 10px'>已享用之優惠</div>
				<div style="text-align: left; padding: 10px">
					<div
						style="padding: 5px 10px; background: green; display: inline-block">促銷優惠</div>
					<div style="width: 50%; display: inline-block;">宅配優惠|免運優惠，滿200元(含以上)免運費</div>
				</div>

			</div>
		</div>
	</div>
	<tr height='80'>
		<td>
			<table
				style="margin: auto; padding: 20px; color: #c7903d; cursor: pointer; font-size: 20px;">
				<tr>
					<td width="265" align='center'><a
						style="text-decoration: none; color: #c7903d;"
						href="<c:url value='products' />">返回商城</a></td>
					<td width="265" align='center'><a style="cursor: pointer;"
						onClick="return Checkout(${subtotal});">結帳去</a></td>
					<td width="265" align='center'><a style="cursor: pointer;"
						onClick="return Abort();">清空購物車</a></td>
				</tr>
			</table>
		</td>
	</tr>
	</table>
	<div style='text-align: center;'>
		<c:if test='${not empty OrderErrorMessage}'>
			<font color='red'>${OrderErrorMessage}</font>
			<c:remove var="OrderErrorMessage" />
		</c:if>
	</div>

	<form>
		<input type="hidden" name="a" />
	</form>

</body>
<script>
		
		
		
		
		var qty = $('.selectQty').val();
		
		var buyQty = $('.buyQty').val();
		console.log("buyQty="+buyQty);
		
	
	
		
		
	
		
		
		$(".selectQty").change(function(){
			var qty = $('.selectQty').val();
		    qty = $(this).val(); 
		 
		});
		
		
		$(".selectQty").change(function(){
			var qty = $('.selectQty').val();
			var id = $(this).attr("id");
			var newid = id.substring(6,7);
			console.log(id);
		  
		   $('#modfy'+newid).click();
		});
		
		 $(document).ready(function() {
				
				$.ajax({
					url : "CartNum",
					type : "GET",
					data : "num",
					async : false,
					success : function(data) {
						console.log("data=" + data)
						$("#showCartNum").html(data);
					}

				});
			});  
		
		
		

</script>
</html>