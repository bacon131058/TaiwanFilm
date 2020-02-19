<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">
	 --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<style>
p {
	margin: 0;
}

#messageBackground {
	background-image: url(${pageContext.request.contextPath}/img/wall1.jpeg);
}

.messageT {
	height: 50px;
	font-size: 20px
	
}
.messagebar:nth-child(odd){
	background-color: 	#E8E8E8	;
	color: white;

}
div{
display:block;
}

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">
</head>
<body>
	<jsp:include page="../fragment/menu.jsp"></jsp:include>
	

	<div id="messageBackground" >

		<form type="get"
			action="${pageContext.request.contextPath}/queryMessages"
			id="search-bar" style="text-align: center">
			<input class="query" type="text" name="keyword" size="113"
				style="height: 50px; font-size: 20px; "	placeholder="搜尋文章⋯" />
		</form>
		<div
			style="display: inline-block; text-align: center; text-valign: center; width: 100%;">
			<div
				style="display: inline-block; text-align: left; width: 80%; border-style: none">
				<div id="query" class="messageT"
					style="display: inline-block; text-align: center; width: 10%">

					<a href="${pageContext.request.contextPath}/createDate">全部主題</a>

				</div>
				<c:forEach var='messageCategory' items='${categoryList}'>
					<div id="query${ messageCategory }" class="messageT"
						style="display: inline-block; text-align: center; width: 10%">
						<a
							href='${pageContext.request.contextPath}/messages/${messageCategory}'>${messageCategory}</a>
					</div>
				</c:forEach>
				<div id="query3" class="messageT"
					style="display: inline-block; text-align: center; width: 10%">

					<a href="${pageContext.request.contextPath}/messageLike">人氣文章</a>
				</div>
				<div style="display: inline-block; text-align: center; width: 45%"></div>
				<div id="query2" class="messageT"
					style="display: inline-block; text-align:center; width: 10%">

					<a href='${pageContext.request.contextPath}/messages/add'>新增文章</a>
				</div>
			</div>
		</div>
		<form name="formm" method="post" action="" style="text-align: center">
			<div
				style="display: inline-block; text-align: center; width: 80%; border-style: none; background-color: #85C1E9">
				<div
					style="display: inline-block; text-align: left; width: 9%; height: 50px; font-size: 25px">
					分類</div>
				<div style="display: inline-block; text-align: left; width: 5%"></div>
				<div
					style="display: inline-block; text-align: left; width: 50%; height: 50px; font-size: 25px">
					標題/內文</div>
				<div
					style="display: inline-block; text-align: right; width: 9% height:50px; font-size: 25px">
					按讚數</div>
				<div
					style="display: inline-block; text-align: center; width: 3%; height: 50px; font-size: 25px">
				</div>
				<div
					style="display: inline-block; text-align: center; width: 9%; height: 50px; font-size: 25px">
					發文者</div>
				<div
					style="display: inline-block; text-align: center; width: 15%; height: 50px; font-size: 25px">
					發文時間</div>
			</div>
			<c:forEach var='message' items='${messages}' varStatus="Id">
				<c:if test="${message.messageDelete==1}">


					<div class="messagebar"
						style="display: inline-block; text-align: center; width: 80%; border-style: none; border-color: yellow; height: px; font-size: 25px; padding:20px 0px">
						<div style="display: inline-block; text-align: center; width: 9% ;padding-top:45px">

							<a
								href='${pageContext.request.contextPath}/messages/${messageCategory}'>${message.messageCategory}</a><br>
						</div>
						<div style="display: inline-block; text-align: left; width: 5%"></div>


						<div style="display: inline-block; text-align: left; width: 50%;vertical-align:top;color: #428bca" >
							<a href="<spring:url value='/message?id=${message.messageId}' />">
								<div class="mt"
									style="display: inline-block; text-align: left; font-size: 30px; color:black">${message.messageTitle}</div>
							</a> <a
								href="<spring:url value='/message?id=${message.messageId}' />">
								<div id="viewArea" class="viewAreas">${message.messageContent}</div>

							</a>
						</div>
						<div style="display: inline-block; text-align: left; width: 1%">
						</div>

						<div style="display: inline-block; text-align: left; width: 7% ;padding-top:45px">
							${message.messageLike }</div>
						<div style="display: inline-block; text-align: center; width: 9%;padding-top:45px ;color:black">
							<span title="發文者">${message.memberBean.memberName }</span>
						</div>
						<div style="display: inline-block; text-align: center; width: 15%;padding-bottom:15px;color:black">

							${message.createDate }
						</div>
					</div>
				</c:if>
			</c:forEach>
		</form>
	</div>
	<script>
		$(function() {
			$("#viewArea img").remove();
		})
		$(function() {
			$("p").each(function() {
				var xx = $(this).html();
				$(this).replaceWith(xx);
			})
		})

		$("#query").mouseover(function() {
			$(this).css("border-bottom", "3px solid red");
		})
		$("#query").mouseout(function() {
			$(this).css("border-bottom", "0px solid ");
		})

/* 		$("#query1").mouseover(function() {

			$(this).css("border-bottom", "3px solid red");
		})
		$("#query1").mouseout(function() {
			$(this).css("border-bottom", "0px solid ");

		}) */

		$("#query2").mouseover(function() {
			$(this).css("border-bottom", "3px solid red");
		})
		$("#query2").mouseout(function() {
			$(this).css("border-bottom", "0px solid ");
		})
		$("#query3").mouseover(function() {
			$(this).css("border-bottom", "3px solid red");
		})
		$("#query3").mouseout(function() {
			$(this).css("border-bottom", "0px solid ");
		})
		$("#query國片討論").mouseover(function() {
			$(this).css("border-bottom", "3px solid red");
		})
		$("#query國片討論").mouseout(function() {
			$(this).css("border-bottom", "0px solid ");
		})
		$("#query募資討論").mouseover(function() {
			$(this).css("border-bottom", "3px solid red");
		})
		$("#query募資討論").mouseout(function() {
			$(this).css("border-bottom", "0px solid ");
		})
		if ($("#${Id.count}") / 2 == 0) {
			$("#${Id.count}").css("background-color", "red");
		}
/* 		$(function() {
			var len = 19; // 超過50個字以"..."取代

			$(".mt").each(function(i) {

				if ($(this).text().length > len) {
					$(this).attr("title", $(this).text());
					var text = $(this).text().substring(0, len - 1) + "...";
					$(this).text(text);
				}
			});
		}); */
		$(function() {

			var len = 45; // 超過50個字以"..."取代
			$(".viewAreas").each(function(i) {

				if ($(this).text().length > len) {
					$(this).attr("title", $(this).text());
					var text = $(this).text().substring(0, len - 1) + "...";
					$(this).text(text);
				}
			});
		});


		 

	</script>
</body>
</html>