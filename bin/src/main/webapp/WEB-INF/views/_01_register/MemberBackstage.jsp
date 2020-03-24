<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/img/icon.ico"/>
<link rel="stylesheet" href="css/movie.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>管理員後台</title>
	
<style>
.h-logo {
    font-size: 30px;
    color: red;
    display: inline-block;
    font-weight: bold;
    padding: 0px 15px; }
	.MainDiv{
		width:100%;	
		text-align:center;
		margin:60px 0px;
		
	}
	.divArea{
	width: 80%;
	height:600px;
	border: 1px solid black;
	display:none;
	}
	
	.active{
		
		display: inline-block;
	}
	.button-type{
	width: 100%}
	.button-type button{
		border: 0px;
		padding: 10px 20px;
		border-radius: 5px 5px 0px 0px;
		background: #8c8cd6;
	}
	
</style>

</head>
<body>

	<div class="h-logo">
	
	<a href="${pageContext.request.contextPath}">FlyingV</a>
	</div>
	<div class="MainDiv">
		<div class="button-type">
			<button class="button1">會員管理</button>
			<button class="button2">訂票</button>
			<button class="button3">募資</button>
			<button class="button4">訂購明細</button>
			
		</div>
	
		<div>
			<div class="divArea active" id="area1"><a href="${pageContext.request.contextPath}/ShowAllMembers">所有會員資料管理</a>
			<div> </div>
			
			</div>
				
			<div class="divArea" id="area2">小天才訂票頁面</div>
			<div class="divArea" id="area3">傑哥募資在這</div>
			<div class="divArea" id="area4">士棠的訂購明細</div>
		</div>
	</div>
<script>
	$(".button1").click(function(){
		$(".divArea").removeClass("active");
		$("#area1").addClass("active");
	});
	$(".button2").click(function(){
		$(".divArea").removeClass("active");
		$("#area2").addClass("active");
	});
	$(".button3").click(function(){
		$(".divArea").removeClass("active");
		$("#area3").addClass("active");
	});
	$(".button4").click(function(){
		$(".divArea").removeClass("active");
		$("#area4").addClass("active");
	});	
</script>
</body> 
</html>