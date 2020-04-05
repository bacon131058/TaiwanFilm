<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<html lang="zh-TW">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<%-- <link rel="stylesheet"	href="${pageContext.request.contextPath}/css/movie.css" /> --%>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico" />
<title>Taiwam Films - 會員登入</title>
<style>
body {
	background-color: white;
}

.sign {
	vertical-align: top;
	width: 300px;
	display: inline-block;
}

.registrTotalDiv {
    padding-top: 100px;	
	margin-bottom: 10%;
	text-align: center;
	padding-top: 250px;
}

.sign {
	text-align: left;
}

#sign-in {
	margin: 0px 30px;
	border-radius: 5px;
	margin: 0px 50px; 
}

#sign-up {
	margin: 5px; 
	border-left: 1px solid black;
    padding-left: 70px;
}

.loginOrOut {
	display: none;
}

.nobooder {
    font-size: 24px;
    margin-bottom: 10px;
    border: 0;
    padding: 0;
    border-bottom: 1px solid black;
    font-family: serif;
	
}

b {
	font-size: 46px;
	margin-bottom: 30px;
}

.but {
	font-size: 16px;
	background-color: black;
	color: white;
	border-block-end: none;
	border-color: white;
	border: 0;
	padding: 10px 30px;
	border-radius: 5px;
}

input:not (.nobooder ){
	border-radius: 5px;
	margin: 0px 10px;
}

.DEMOONE{
	position:absolute;
	top:100px;
	right:100px;
}
.errorMsg{
color:red;
}
</style>
</head>
<body style="background-color: white;">
	<jsp:include page="../fragment/menu.jsp" />
	 
	

	<div class="registrTotalDiv">
		<div>

			<div class="sign" id="sign-in">
				<b>登入</b>
				<br>
				<br>   
				<p class="errorMsg" id="errorBox">${errorMessage}</p>
				<form action='${pageContext.request.contextPath}/Checklogin'
					method='post'>
					<input id="email" name="email" class="nobooder" type='email'
						placeholder='輸入電子信箱' required  style="width:90%"/><br> 
						<input id="password" name="password" class="nobooder" type='password'
						placeholder='輸入密碼' required  style="width:90%"/><br> 
						<label for="remember" class="grey dark"> <br> 
					<input type="checkbox" name="rememberBox" id="checkbox" />記得我
					</label> <br> <br> <input class="but" type='reset' value='清除' />
					<input class="but" type='submit' value='確認登入' 
						onclick='return check()' />
				</form>

				<!-- 			<p style="font-size: 10px">忘記密碼?</p> -->
			</div>

			<div class="sign" id="sign-up">
				<b>新使用者</b> <br>
				<br>
				<p class="smalltext">若您還未註冊TaiwanFilm.com會員</p>
				<br>
				<p class="smalltext">我們將會請您提供必需資訊以便使用</p>
				<br>
				<button class="but">
					<a class="but" href="members/add">登入 / 註冊</a>
				</button>

			</div>
		</div>
	</div>
	<div class="DEMOONE">
	<input type="button" value="DEMO管理員" onclick="oneButtonInport2()"> 
	<input type="button" value="DEMO一般會員" onclick="oneButtonInport1()">
	</div>

	<script	src="${pageContext.request.contextPath}/_01_register/JQ/jquery.cookie.js"></script>
	<script>

		
	<%-- 如果有儲存帳號cookie, 將帳號載入 +打勾remember--%>
		if ($.cookie("remEmail")) {
			$("#checkbox").prop("checked", true);
			$("#email").val($.cookie("remEmail"));
		}
	<%-- 如果有儲存密碼cookie, 將密碼載入 --%>
		if ($.cookie("remPassword")) {
			$("#password").val($.cookie("remPassword"));
		}
		//管理員帳號密碼輸入在此
		function oneButtonInport2() {
			var em = "eeit@gmail.com";
			var pwd = "Sa123456";		
			$("#email").val(em);
			$("#password").val(pwd);
		}
// 		一般會員帳號密碼一鍵輸入
		function oneButtonInport1() {
			var em = "eeit11099@gmail.com";
			var pwd = "Sa123456";		
			$("#email").val(em);
			$("#password").val(pwd);
		}
		
	</script>
</body>
</html>