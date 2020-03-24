<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<meta charset="UTF-8">
<title>新增會員</title>

<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
.memberNewTotalDiv{
	width:100%;
	height: 570px;
	background-color:white;
	text-align:center;
	padding-top:100px;
}
.memberNewMainDiv {
	width:450px;
	display: inline-block;
	background-color: white;
       }
#focusToBlue:hover{
      color: blue
      }
      body{
      background-color:wihte;
      background-repeat:no-repeat;
      background-size:100%;
      }
	.loginOrOut{
	display:none;
	}
	body{
	background-color:white;
	}
	b{
	font-size: 46px;
	margin-bottom: 10px;
	}
	#focusToBlue{
	font-size:8px;
	}
	
	.nobooder {
    font-size: 24px;
    margin-bottom: 10px;
    border: 0;
    padding: 0;
    border-bottom: 1px solid black;
}
	input:not(.allBt .oneEntry){
	margin: 0px 10px;
	font-size: 24px;
    margin: 0px 10px 10px 10px;
}
.allBt{
    background-color: black;
    border: 0;
    color: white;
    font-size: 16px;
    padding: 10px 30px;
    border-radius: 5px;
    margin: 0px 10px 10px 10px;
}
.DEMOONE{
	position:absolute;
	top:100px;
	right:100px;
}
</style>
</head>
<body>
<jsp:include page="../fragment/menu.jsp" /> 
<div>
	<form:form method='POST' modelAttribute="MembersBean" 
	action="${pageContext.request.contextPath}/_01_register/registerNewMember"
	 enctype='multipart/form-data' >
	 <div class="memberNewTotalDiv">
		<div class="memberNewMainDiv">
			<h3>
				<b >輸入會員資料</b>
			</h3>	

				<table>
					<tr><td><span style="color: red;">*</span>
						<td><form:input  class="nobooder" path="email" id="email" placeholder='電子信箱' required='required' value=""/>	
						<td id="errorBox" style="font-size:8px;text-align:left"></td>					
					</tr>					
					<tr><td><span style="color: red;">*</span>
						<td><form:input class="nobooder" path="memberName" id="memberName" 
						placeholder='會員姓名' required='required' value=""/>
						<td id="nameErrorBox" style="font-size:8px;text-align:left"></td>
					</tr>						
					<tr><td><span style="color: red;">*</span>
						<td><form:password class="nobooder" path="password" id="password" 
						placeholder='密碼' required='required' maxlength="16" 
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
						title="密碼請符合輸入格式!"/>
						<tr><td><td><small style="color: red; font-size:8px;">請輸入8-16碼英數字(包含英文大小寫)</small></tr>
					<tr><td><span style="color: red;">*</span>
						<td><form:password  path="password1" id="password1" class="nobooder"
							placeholder='確認密碼'  required='required' maxlength="16" 
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"/>
						<td id="pwdErrorBox" style="color: red; font-size:8px;text-align:left" ></td>
						<tr><td><form:hidden path="memberMode" value="1" />
<%-- 						<td> <form:input type='file' path="memImage"  --%>
<%-- 			id="memberImage"  class='form:input-large' src="../img/NoImage_Male.png"  />   --%>
<!-- 						<td><img  id="" src="../img/NoImage_Male.png" style="display:none" > -->
					</tr>
					<tr><td>
						<td>
							<input class="allBt" type="reset" id="bt2" value="取消"/>
							<input  class="allBt" type="submit" id="bt1" value="確認" disabled onclick="registerOK()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</tr>
				</table>
			<div style="text-align:left">
				已經有帳號了?&nbsp;&nbsp;<input type="button" id="backToLogin" class="allBt"
					onclick="location.href='http://localhost:8080/TaiwanFilm/register'"
					value="回到登入頁" />
<%-- <a href='${pageContext.request.contextPath}/views/_01_register/register.jsp'><input type="button" value="登入"></a> --%>
			</div>
<!-- 	<br> -->
<!-- 			<input type="button" -->
<!-- 				   onclick="location.href='http://localhost:8080/TaiwanFilm/'" -->
<!-- 				   value="回首頁" /> -->
<br>
				<div style="color: red; font-size:8px; text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;*為必填欄位</div>
				<div  style="font-size:8px;"> 已閱讀並同意：
				<b id="focusToBlue" >使用者協定</b>和
				<b id="focusToBlue" > 隱私政策</b></div>
			<br>
		</div>
		</div>
</form:form>
</div>
<div class="DEMOONE">
	<input  id="oneEntry"type="button" onclick="oneEntry1()" value="DEMO用註冊會員"/>
</div>
		<script	src="${pageContext.request.contextPath }/js/registerNewMember.js"></script>
		<script>
		
//一鍵輸入資料
		function oneEntry1() {
			 var email = "eeit11099@gmail.com";
			 var pass = "Sa123456";
			 var name = "吳慷仁";
			 $("#email").val(email);
			 $("#password").val(pass);
			 $("#password1").val(pass);
			 $("#memberName").val(name); 
			}

		
		
		function registerOK(){		
			alert("註冊成功")}
		//當密碼欄有更動時 確認密碼相同 全部有值 =>開啟確認按鈕
	$(function() {
			$("#password").change(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();
				if (pwd2 == pwd1 ) {
					$('#pwdErrorBox').text("");
					if(mname !=""){
						if(email !=""){
					$("#bt1").prop("disabled", false);
					$("#bt1").css("background-color","black");
						}
					}
				}else {
					$("#bt1").prop("disabled", true);
					$("#bt1").css("background-color","grey");
					$('#pwdErrorBox').text("確認密碼不符");

					}
				})
			//當確認密碼欄有更動時 確認密碼相同 全部有值 =>開啟確認按鈕
			$("#password1").change(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();
				if (pwd2 == pwd1 ) {
					$('#pwdErrorBox').text("");
					if(mname !=""){
						if(email !=""){
					$("#bt1").prop("disabled", false);
					$("#bt1").css("background-color","black");
						}
					}
				}else {
					$("#bt1").prop("disabled", true);
					$("#bt1").css("background-color","grey");
					$('#pwdErrorBox').text("確認密碼不符");
					}
			})
		})	
		$(document).ready(function(){
			$('#memberName').blur(function(){
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();	
				if(mname != ""){
					$('#nameErrorBox').text("");
					if(email != "" && pwd1 == pwd2 && pwd1 != ""){
						$("#bt1").prop("disabled", false);
						$("#bt1").css("background-color","black");
					}
				}else{
					$('#nameErrorBox').css("color","red").text("請輸入名稱");
					
				}
			})
			
		})
		//email 更動時 確認信箱能否使用
		$(document).ready(function(){
			$("#email").change(function(){
				var pwd1 = $("#password").val();
				var pwd2 = $("#password1").val();
				var email = $('#email').val();
				var mname = $('#memberName').val();
				 $.ajax({
					url:"${pageContext.request.contextPath}/emailChecker?email="+email,
					type: "GET",
					error: function(data){
						console.log('error');
					},
					success: function(data){
						if(data){
							$('#errorBox').css("color","red").text("此帳號重複");
							$("#bt1").prop("disabled", true);
							$("#bt1").css("background-color","grey");
						}else if(email !="" ){
							$('#errorBox').css("color","green").text("帳號可使用");
							if(pwd1 == pwd2 && mname != ""){
								$('#pwdErrorBox').text("");
								$("#bt1").prop("disabled", false);
								$("#bt1").css("background-color", "black");
							}
								
						}else{
							$('#errorBox').css("color","red").text("請輸入帳號");
							$("#bt1").prop("disabled", true);
							$("#bt1").css("background-color","grey");
						}
						console.log('success');
					}
				 })
			})
		})
		
		function oneButtonInport() {
			var name = "Jeter";
			var em = "Jeter1983@gmail.com";
			var pwd = "Sa123456"
			var pwd1 = "Sa123456"
			$("#memberName").val(name);			
			$("#email").val(em);
			$("#password").val(pwd);
			$("#password1").val(pwd1);
		}
		
		
		</script>	 
</body>
</html>