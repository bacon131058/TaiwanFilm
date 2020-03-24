<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/movie.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<style>
.memberDetailTotalDiv2 {
	width: 100%;
	height: 570px;
	background-color: white;
	text-align: center;
}

.loginOrOut {
	display: none;
}

.memberDetailMainDiv {
	margin-top: 30px;
	width: 680px;
	display: inline-block;
}

.memberDetailMainDiv tr {
	text-align: left;
}

body {
	background-color: white;
}
<<<<<<< Updated upstream
b {
	font-size: 46px;
	margin-bottom: 10px;
}

input:not (.allBt ){
	margin: 0px 10px;
	font-size: 20px;
	margin: 0px 10px 10px 10px;
}

.allBt {
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

.allBt{
    background-color: black;
    border: 0;
    color: white;
    font-size: 16px;
    padding: 10px 30px;
    border-radius: 5px;
    margin: 0px 10px 10px 10px;
}
b {
    font-size: 46px;
    margin-bottom: 30px;
}
.imgdiv{    
    width: 150px; 
    height: 150px; 
    overflow: hidden; 
    position: relative;
    border-radius: 50%;
}
.imgstyle{
width: 100%; 
position: absolute; 
top: 50%; left: 50%; 
transform: translate(-50%, -50%);

}

.nobooder {
    font-size: 24px;
    margin-bottom: 10px;
    border: 0;
    padding: 0;
    border-bottom: 1px solid black;
}

</style>
</head>
<body>
	<jsp:include page="../fragment/menu.jsp" />
	<div class="memberDetailTotalDiv2">
		<div class="memberDetailMainDiv">
			<h3>
				<b>修改會員資料</b>
			</h3>
			<form method="POST" id="UpdateMember"
				action="${pageContext.request.contextPath}/_01_register/DoUpdateMember"
				enctype='multipart/form-data'>
				<table>

					<tr>
						<td>
						<td><input name="password" id="password" type="text"
							value='${sessionScope.members.password}' style="display: none" />
					<tr>
						<td class="AllText">顯示名稱
						<td class="AllText">性別
					<tr>
						<td><input class="nobooder"name="memberName" id="memberName" type="text"
							value='${sessionScope.members.memberName}' />
						<td style="font-size: 24px;"><input style="font-size: 24px;" type="radio" id="gender" name="gender" value="男生" />男生
							<input style="font-size: 24px;" type="radio" id="gender" name="gender" value="女生" />女生
					<tr>
						<td class="AllText">聯絡信箱
						<td class="AllText">生日
					<tr>
						<td style="font-size: 24px;">${sessionScope.members.email}
						<input name="email" id="email" type="hidden"	value='${sessionScope.members.email}'/>
						<td><input class="nobooder"type="date" name="birthDay" id="birthDay" value="${sessionScope.members.birthDay}"/>
					<tr>
						<td class="AllText">個人照片
						<td class="AllText">預覽照片
					<tr>

						<td><input type='file' name="memImage" id="memberImage"
							class='form:input-large' />
							<BR>
							<BR>
							<BR>
							<BR>
							<input type="submit" class="allBt" id="bt1" value="確認" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="allBt" id="bt2" value="復原" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<td>
							<div class="imgdiv">
							<img class="imgstyle" style="dsiplay: inline-block" id="oldMemberImage"
							src='${pageContext.request.contextPath}/crm/picture/${sessionScope.members.memberId}' />
							<img class="imgstyle" id="preview_memImage" src="#" style="display: none" />
							</div>
					<tr>
						<td>
							
				</table>
			</form>
			

		</div>
	<div class="DEMOONE" style="text-align:left"><input type="button" value="DEMO用" onclick="oneButtonInport()" > </div>
	</div>
	
	<jsp:include page="../fragment/bottom.jsp" />

	<script>
	
		$(document).ready(function() {

			if(${sessionScope.members.gender =="男生"}){
				$("input[name='gender'][value=男生]").attr("checked",true); 				
			}else if(${sessionScope.members.gender =="女生"}){
				$("input[name='gender'][value=女生]").attr("checked",true); 
			}
		});
	
		$("#memberImage").change(function() {
			//當檔案改變後，做一些事 
			readURL(this); // this代表<input id="memberImage">
			$("#preview_memImage").css("display", "inline-block");
			$("#oldMemberImage").css("display", "none");
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview_memImage").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function oneButtonInport() {
			var name = "吳慷仁先生";
			var gerd = 	"男生";
			var birt = "1982-11-24";
			$("#memberName").val(name);			
			$("input[name='gender'][value=男生]").attr("checked",true); 
			$("#birthDay").val(birt);
		}
	</script>
</body>
</html>
<%-- 			<form:form method="POST" modelAttribute="MembersBean"  --%>
<%-- 			action="${pageContext.request.contextPath}/_01_register/DoUpdateMember" --%>
<%-- 			enctype='multipart/form-data'>  --%>
<%-- 			<form:input  path="memberName" id="memberName"  --%>
<%-- 						value='${sessionScope.members.memberName}' />					  --%>
<%-- 			<form:input  path="email" id="email" value='${sessionScope.members.email}'/> --%>
<%-- 			<form:radiobutton  path="gender" name="gender" value="男生" />男生  --%>
<%--  			<form:radiobutton  path="gender" name="gender" value="女生" />女生 --%>
<%-- 			<form:input type="date" path="birthDay" id="birthDay" /> --%>
<%-- 			<form:input type='file' path="memImage" --%>
<%-- 			id="memberImage"  class='form:input-large' />  --%>
<%-- 			</form:form> --%>