<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link
	href="https://fonts.googleapis.com/css?family=Bangers|Odibee+Sans|Permanent+Marker&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eDM.css" type="text/css" />



<c:set var='debug' value='true' scope='application' />
<table class='menuOuter'>
	<tr height="48px">
		<td width="60px" rowspan='2'></td>
		<td>
			<table class='menuInner'>
				<tr>
					<td class='menuData'
						style="font-size: 60px; letter-spacing: -3px; width: 15%;">
						<p style="margin: 0px">
							<a href="<c:url value='/index.jsp' />">TaiwanFilmsGuide</a>
						</p>
					</td>

					<c:if test="${empty LoginOK}">
						<td class='menuData'>
							<div class='menu'>
								<a class="sub" href="<c:url value='/_02_login/login.jsp' />">
									Login </a>
					</c:if>
					</div>
					</td>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ funcName != 'SHO' }">
								<a class="sub" href="<c:url value='/products' />"> Shop </a>
							</c:if>
							<c:if test="${ funcName == 'SHO' }"> Shop
               </c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>

							<a class="sub" href="<c:url value='/ShowCartContent' />">
								Check </a>

						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>

							<a class="sub" href="<c:url value='/orderList.do' />"> Orders
							</a>


						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ funcName != 'BMT' }">
								<a class="sub"
									href="<c:url value='/_20_productMaintain/DisplayPageProducts' />">
									Maintain </a>
							</c:if>
							<c:if test="${ funcName == 'BMT' }"> Maintain
              </c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>&nbsp;</div>
					</td>

					<td class='menuData'>
						<div class='menu' style='width: 60px;'>
							<c:if test="${ funcName != 'IND' }">
								<a class="sub" href="<c:url value='/index' />">Home</a>
							</c:if>
						</div>
					</td>

					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ ! empty LoginOK }">
								<a class="sub" href="<c:url value='/_02_login/logout.jsp' />">
									Logout </a>
							</c:if>
						</div>
					</td>

					<td class='menuData'><c:if test="${! empty LoginOK }">
							<img height='40px' width='30px'
								src='${pageContext.request.contextPath}/_00_init/getMemberImage?id=${LoginOK.memberId}'>

						</c:if></td>
					<td class='menuData'>
						<div class='menu'>
							<a href="<c:url value='/ShowCartContent' />"><div id="showCartNum"
								style="height: 50px; background-image: url('images/shopcart2.png'); background-repeat: no-repeat; background-size: 50px 50px">0</div>
								</a>
						</div>
					</td>

					<td class='menuData'>
						<div class='menu'>
							<a class="sub" href="<c:url value='productsM' />"> Back-End</a>
						</div>
					</td>
				</tr>
				<!-- 				<tr height='20px'> -->
				<%-- 					<td width='300px' colspan='9'><small>${pageContext.session.id }</small> --%>
				<!-- 					</td> -->
				<!-- 				</tr> -->
			</table>
	<tr>
		<td>
			<hr style="color: gray; background-color: black; height: 2px;">
		</td>
	</tr>
</table>

<script>
	$(".sub").mouseover(function() {
		$(this).animate({
			height : "45px"
		}, 100);

	});
	$(".sub").mouseover(function() {
		$(this).animate({
			height : "30px"
		}, 100);

	});
	

	
/* 	$(document).ready(function() {
		$("#111").click(function() {
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
	}); */
	
	
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