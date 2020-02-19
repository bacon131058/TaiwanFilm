<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div class="header">
	<div class="h-logo">
		<a href="/TaiwanFilm">FlyingV</a>
	</div>
	<div class="left-menu">
		<div>
			<a href="movieIntro">網路訂票</a>
		</div>
		<div>
			<a href="">娛樂購物</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/getAllProject">贊助電影</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}//createProjectFirst">贊助電影</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/fundsCategory">贊助電影</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/messages">留言板</a>
		</div>
	</div>
	<div class="right-menu">
		<c:if test="${sessionScope.members.memberId == 1}">		
		<div>
			<a href="activitiesM">活動後台</a>
		</div>
		<div>
			<a href="alterMovie">後台</a>
		</div>
		<div>
		<a href="${pageContext.request.contextPath}/_01_register/MemberBackstage">管理員後台</a>
		</div>
		</c:if>
		<c:if test="${not empty sessionScope.members.email}">
			<div class="myAccount">
				<span id="memberButton"> ${sessionScope.members.memberName}</span>
				<!--  如果沒有給照片的話    性別是女生 就給女生照片   無照片跟男性給男生照片 -->
				<c:if test="${empty sessionScope.members.fileName}">
					<c:choose>
						<c:when test="${sessionScope.members.gender =='女生' }">
						<img width='20' height='20' src='img/NoImage_Female.jpg' />
						</c:when>
						<c:otherwise>
						<img width='20' height='20' src='img/NoImage_Male.png' />
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${not empty sessionScope.members.fileName}">
				<img width='20' height='20' src='${pageContext.request.contextPath}/crm/picture/${sessionScope.members.memberId}' />
				</c:if>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.members.email}">
			<div class="myAccount">
				<a href="${pageContext.request.contextPath}/register">登入/註冊</a>
			</div>
		</c:if>
	</div>
</div> 
<div id="memberDetail"
	style="padding: 5px; display: none; width: 100px; height: 200px; background: #ebebeb; 
	position: absolute; right: 5px; top: 68px; z-index: 800">
	<a href="${pageContext.request.contextPath}/UpdateMember">會員資料</a> <br>
	<a href="${pageContext.request.contextPath}/member/purchase">個人贊助</a> <br>
	<a href="alterTicket">訂票資料</a> <br>
	<a href="${pageContext.request.contextPath}/logout">登出</a>
</div>
<script>
$("#memberButton").click(function() {
	$("#memberDetail").fadeToggle(500);
});
</script>
