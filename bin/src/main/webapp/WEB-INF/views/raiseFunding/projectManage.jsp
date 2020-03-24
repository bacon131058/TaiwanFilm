<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/UtilTool.js"  ></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Manage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menuStyle1.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<style>

body{
		background-color: #f1f1f1;margin:0}
		.TaiwanFilms{
		display: inline-block;font-size: 35px;font-weight: bold;color: #428bca; padding:15px 5px; 
		}
		.backStage-top{  
			width: 100%;		
			height: 80px;
			background: white;
			position: fixed;   
			margin-top: -12px;
			z-index:99 ;
			box-shadow: 0 0.25rem 0.125rem 0 rgba(0,0,0,0.05);
			}         
		
		.backStage-bar{
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
		.backStage-title{
			width: 100%;  
			color: white; 
			font-weight: bold; 
			background: #428bca;
			text-align: left;    
			font-size: 25px;
			border-bottom: 1px solid white; 
			
			} 
			
		     
     
		.choose-list{
			display: none;
			text-align: left;    
 
		}

		.backStage-title div{
			width: 100%;
		}
		.choose-list a div{
			text-decoration: none;
			color: #1e2a3a;
		}  
 
		.choose-list a{
		text-decoration: none; font-size: 18px;}
		
		.a-bar1:hover{background: #EA0082;}.a-bar2:hover{background: #EA0082;}.a-bar3:hover{background: #EA0082;}
		.f-bar1:hover{background: #EA0082;}.f-bar2:hover{background: #EA0082;}.f-bar3:hover{background: #EA0082;}
		.m-bar1:hover{background: #EA0082;}.m-bar2:hover{background: #EA0082;}.m-bar3:hover{background: #EA0082;}
		.s-bar1:hover{background: #EA0082;}.s-bar2:hover{background: #EA0082;}.s-bar3:hover{background: #EA0082;}
		.i-bar1:hover{background: #EA0082;}.i-bar2:hover{background: #EA0082;}.i-bar3:hover{background: #EA0082;}
	
		.back-member:hover{background:#EA0082}
		.back-funds:hover{background:#EA0082} 
		.back-activity:hover{background:#EA0082} 
		.back-movie:hover{background:#EA0082} 
		.back-message:hover{background:#EA0082} 
		.back-shopping:hover{background:#EA0082} 


.content {
	width: 90%;
	background: white;
	border-radius: 10px;
	margin: 10px 0px;
	display: inline-block
}

.content-area {
	width: 90px;
	display: inline-block;
	height: 50px;
	padding-top: 15px;
	text-align: center
}
</style>
</head>

<body style="background: #d5d6db;">
	<jsp:include page="../fragment/backStageInclud.jsp" />
	<div class="pageWrapper">
		<div class="">
			<h2>目前存在專案</h2>
		</div>
		<div class="formWrapper">
			
	<div class="name">
		<div class="content">
			<div class="content-area" >募資名稱</div>
			<div class="content-area">募資起始日</div>
			<div class="content-area">募資截止日</div>
			<div class="content-area">目前金額</div>
			<div class="content-area">目標金額</div>
			<div class="content-area">進度百分比</div>
			<div class="content-area" content="  "></div>
		</div>
		<!--  寫foreach -->
		<c:if test="${cfBeans!=null}">
			<c:forEach items="${cfBeans}" var="cfBean">
				<div class="content project">
					<div class="content-area" >${cfBean.projBean.projectName}</div>
					<div class="content-area">${cfBean.dateBegin}</div>
					<div class="content-area">${cfBean.dateEnd}</div>
					<div class="content-area dollar" >${cfBean.fundsNow}</div>
					<div class="content-area dollar" >${cfBean.fundsGoal}</div>
					<div class="content-area">${cfBean.percent}</div>
					<div class="content-area"><button id="${cfBean.projBean.projectId}">修改</button></div>
				</div>
			</c:forEach>
		</c:if>
		<!--  寫foreach -->
	</div>
		</div>
	</div>

	<script>
	$(".dollar").text(function(){
		$(this).text(formatNumber($(this).text())) ;
	})
	
	$("button").click(
						function() {
							var id = $(this).attr("id");
							window.location.href = "${pageContext.request.contextPath}/updateProject/"
									+ id;
						})
	</script>

</body>

</html>