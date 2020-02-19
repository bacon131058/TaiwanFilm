<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath}/javascript/jquery-1.9.1.js'></script>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<title>所有會員資料</title>
<style>
.name {
	padding: 100px 0px 0px 17%;
	text-align: center;
}

.content {
	width: 80%;
	background: white;
	border-radius: 10px;
	margin: 10px 0px;
	display: inline-block;
}

.content-area {
	width: 19%;
	display: inline-block;
	height: 50px;
	padding-top: 15px;
	text-align: center;
	font-weight: bold;
}

.content-form {
	width: 49%;
	display: inline-block;
	height: 50px;
	padding-top: 15px;
	text-align: center;
	font-weight: bold;
}

.but1 {
	background-color: #428bca;
	border-color: #357ebd;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 1.428571429;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid transparent;
	border-radius: 4px;
}

h1 {
	text-align: center;
	font-size: 36px;
}

.query {
	
}

#search {
	text-align: left;
	border: 0;
	padding: 0;
	border-bottom: 1px solid black;
	background-color: #ebebeb;
	font-size: 20px;
	vertical-align: super;
}

.forForm {
	width: 38%;
	display: inline-block;
}

.thispage {
	text-decoration: underline;
}

.pages {
	display: none;
}

.holder {
	font-size: 21px;
	text-align: center;

}
.product {

	display: inline-block;
	border: 1px solid #cecaca;
	border-radius: 2%;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	margin: 5px;
}
.product:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 25px #D3E7E7;
}
.allProductPage a:hover {
	color: #ca9a16;
}

</style>
</head>
<body>
	<jsp:include page="../backstage.jsp" />
	<div class="name">
		<h1>會員資料</h1>
		<hr>
		<div style="text-align: left;"></div>
		<c:choose>
			<c:when test="${empty members}">沒有任何會員資料<br>
			</c:when>
			<c:otherwise>
				<div class="">

					<form action="${pageContext.request.contextPath}/FuzzyQuery">
						<input id="search" class="query" type="text" name="keyword"
							placeholder="搜尋文章⋯"> <img width='23' height='23'
							src='${pageContext.request.contextPath}/img/search.png' />
					</form>
					<br>
					<br>
					<div class="content">
						<div class="content-area">編號</div>
						<div class="content-area">信箱</div>
						<div class="content-area">姓名</div>
						<div class="content-area">會員狀態</div>
						<div class="content-area">確認</div>
					</div>
					<c:forEach var='member' items='${memberlist}' varStatus="status">
						
						<div class="content">
							<div class="content-area">
								<a	href="${pageContext.request.contextPath}/_01_register/modify/${member.memberId}">${member.memberId}</a>
		
							</div>
							<div class="content-area">${member.email}</div>
							<div class="content-area">${member.memberName}</div>
							<div class="forForm">
								<form method="POST"
									action="${pageContext.request.contextPath}/_01_register/DoNotMember">
									<div class="content-form">
										<input style="display: none;" name="memberId" id="memberId"
											value="${member.memberId}" /> <input style="display: none;"
											name="email" id="email" value="${member.email}" /> <select
											name="memberMode" required>
											<!-- 										從資料庫確認狀態給預設值 -->
											<option value="2"
												<c:if test="${member.memberMode =='2'}"> selected="true"</c:if>>管理員</option>
											<option value="1"
												<c:if test="${member.memberMode =='1'}"> selected="true"</c:if>>一般會員</option>
											<option value="0"
												<c:if test="${member.memberMode =='0'}"> selected="true"</c:if>>非會員</option>
										</select>
									</div>
									<div class="content-form ">
										<div>
											<input class="but1" type="submit" id="bt2" value="確認"
												onclick="DomodifyMode()" />
										</div>
									</div>
								</form>
							</div>
						</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		<button>
			<a href="ShowAllMembers"><div class="menu-buttonStyle">回前頁</div></a>
		</button>

		<hr>
<div class="holder">
<!-- 		<a href="#" class="p-previous">← previous</a>  -->
<!-- 		<a href="#" id="page1" class="pages thispage">1</a>  -->
<!-- 		<a class="pages" href="#" id="page2">2</a> -->
<!-- 		<a class="pages" href="#" id="page3">3</a> -->
<!-- 		<a class="pages" href="#" id="page3">4</a>  -->
<!-- 		<a class="pages" href="#" id="page3">5</a>  -->
<!-- 		<a class="pages" href="#" id="page3">6</a>  -->
<!-- 		<a class="pages" href="#" id="page3">7</a>   -->
<!-- 		<a href="#" class="p-next">next→</a> -->
	</div>
	</div>
	<script type='text/javascript'>
		function DomodifyMode() {
			alert("會員狀態修改成功");

		}
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();
				}
				return false;

			});
		})
		
		$('#page1').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page1').addClass("thispage");
			$('.product').hide();
			$('#pageproduct1').show();
			$("#pageproduct2").show();
			$("#pageproduct3").show();
			$("#pageproduct4").show();
			$("#pageproduct5").show();
			$("#pageproduct6").show();

		});
		$('#page2').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page2').addClass("thispage");

			$('.product').hide();
			$("#pageproduct7").show();
			$("#pageproduct8").show();
			$("#pageproduct9").show();
			$("#pageproduct10").show();
			$("#pageproduct11").show();
			$("#pageproduct12").show();
		});

		$('#page3').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page3').addClass("thispage");

			$('.product').hide();
			$("#pageproduct13").show();
			$("#pageproduct14").show();
			$("#pageproduct15").show();
			$("#pageproduct16").show();
			$("#pageproduct17").show();
			$("#pageproduct18").show();
		});
		$('#page4').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page4').addClass("thispage");

			$('.product').hide();
			$("#pageproduct19").show();
			$("#pageproduct20").show();
			$("#pageproduct21").show();
			$("#pageproduct22").show();
			$("#pageproduct23").show();
			$("#pageproduct24").show();
		});
		$('#page5').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page5').addClass("thispage");

			$('.product').hide();
			$("#pageproduct25").show();
			$("#pageproduct26").show();
			$("#pageproduct27").show();
			$("#pageproduct28").show();
			$("#pageproduct29").show();
			$("#pageproduct30").show();
		});
		$('#page6').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page6').addClass("thispage");

			$('.product').hide();
			$("#pageproduct31").show();
			$("#pageproduct32").show();
			$("#pageproduct33").show();
			$("#pageproduct34").show();
			$("#pageproduct35").show();
			$("#pageproduct36").show();
		});
		$('#page7').click(function() {
			$('.holder a').removeClass("thispage");
			$('#page7').addClass("thispage");

			$('.product').hide();
			$("#pageproduct37").show();
			$("#pageproduct38").show();
			$("#pageproduct39").show();
			$("#pageproduct40").show();
			$("#pageproduct41").show();
			$("#pageproduct42").show();
		});

		$('.p-previous').click(function() {

			if ($('.pages').hasClass("thispage")) {
				var pagenumminus = $('.thispage').attr("id").substring(4) - 1;
				console.log(pagenumminus);
				$('[id=page' + pagenumminus + ']').click();
			}
		});

		$('.p-next').click(
				function() {
					if ($('.pages').hasClass("thispage")) {

						var pagenumadd = parseInt($('.thispage').attr("id")
								.substring(4)) + 1;
						if (pagenumadd <= pagemath) {

							console.log("pagenumadd=" + pagenumadd);
							$('[id=page' + pagenumadd + ']').click();
						}
					}
				});

		var pagingcount = $('.pagingcount').html();
		console.log(pagingcount);

		var pagemath = parseInt(((pagingcount - 1) / 6) + 1);
		console.log('pagemath=' + pagemath);

		var pagenum = $('.pages').attr('id').substring(4);
		console.log(pagenum);

		switch (pagemath) {
		case 7:
			$('#page7').show();
		case 6:
			$('#page6').show();
		case 5:
			$('#page5').show();
		case 4:
			$('#page4').show();
		case 3:
			$('#page3').show();
		case 2:
			$('#page2').show();
		case 1:
			$('#page1').show();
		};
		
		
	</script>

</body>
</html>