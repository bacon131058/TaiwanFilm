<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<meta charset="UTF-8">
<!-- <link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->

	
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
	
<style type="text/css">
fieldset {
	border: 1px solid black;
	width: 600px;
	margin: auto;
	padding: 10px;
}

body{
	background-color: #f1f1f1;
}

.inner {
	vertical-align: top;
}

input {
	width: 100%;
}

.form-group {
	width: 50%;
}

.control-label {
	border-left: 3px solid #00bbd6;
	color: #00bbd6;
	font-size: 14px;
	font-weight: bold;
	padding-left: 10px
}

.col-lg-10 {
	padding: 10px 0px;
}

#activityAuthor {
	background-color: white;
}

#activityTitle {
	padding: 6px;
	border-radius: 2px;
}
.col-lg-10 input{
	width: 100%;
	height: 50px;
}
#btnAdd {
	width: 100%;
	padding-left: 30px;
	background-color: #eb4b4b;
	color: white;
	font-size: 16px;
	letter-spacing: 3px;
	padding: 6px;
	border-radius: 3px
}

.form-group {
	padding: 5px 0px;
	width: 100%;
}
#activityNumber{
	font-size:40px;
	border:0px;
	font-weight: bold;
	background:#f1f1f1;
	color: red;
}

</style>
<title>updateActivity</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />

</head>
<body onload="ShowTime()"> 
	<div class="header">
		<div class="h-logo" style="letter-spacing: -3px">
			<a href="${pageContext.request.contextPath}/activitiesM">
				<p class="Theme">TaiwanFilmsGuide
			</a>
		</div>

		<div class="left-menu">
			<div>
				<a href="">提案</a>
			</div>
			<div>
				<a href="">探索</a>
			</div>
			<div>
				<a href=''>探索</a>
			</div>
		</div>
		<div class="right-menu">
			<div>
				<a href="">我的帳戶</a>
			</div>
		</div>
	</div>


	<section>
		<div class="container">
			<h1 style="text-align: center">修改產品資料</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="coverpic"></div>
		<form:form method='POST' modelAttribute="activityBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='activityNumber'>
						活動編號 </label>
					<div class="col-lg-10">
						<form:input id="activityNumber"   path="activityNumber" type='text'
							class='form:input-large' maxlength="20"   />
					</div> 
				</div> 
			
			 
 				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='activityTitle'>
						活動名稱（最多輸入20字) </label>
					<div class="col-lg-10">
						<form:input id="activityTitle"   path="activityTitle" type='text'
							class='form:input-large' maxlength="20" style="font-size:20px;font-weight: bold"  />
					</div>
				</div> 


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="activityAuthor">
						主辦方 </label>
					<div class='col-lg-10'>
						<form:input id="activityAuthor" path="activityAuthor" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"
						for='activityMainContent'> 主頁活動內容顯示(最多輸入60字) </label>
					<div class="col-lg-10">
						<form:input id="activityMainContent" path="activityMainContent"
							type='text' class='form:input-large' maxlength="60" />
					</div>
				</div>




				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"
						for='activityContent'> 內頁活動內容</label>
					<div class="col-lg-10">
						<form:textarea cols="80" rows="10"  id="activityContent" path="activityContent"
							type='text' style="font-size:15px" class='form:input-large' />
					</div>
				</div>








				<div class="form-group" style="display: none">
					<label class='control-label col-lg-2 col-lg-2' for="activityWatched">
						觀看次數(測試) </label>
					<div class='col-lg-10'>
						<form:input id="activityWatched" path="activityWatched" type='text'
							class='form:input-large' value="0"/>
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="status">
						狀態</label>
					<div class='col-lg-10' >
						<form:select id="status" path="status" type='text'
									class='form:input-large'>	
							<form:option selected="true" value="-1" disabled="true" label="請選擇狀態"></form:option>
							<form:option  value="1"  label="活動上架"></form:option>
							<form:option  value="0"  label="活動下架(已過期)"></form:option>
						</form:select>
					</div>
				</div> 
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						活動類別</label>
					<div class='col-lg-10'>
						<form:select id="category" path="category" type='text'
							class='form:input-large' >								 
							<form:option selected="true" value="-1" disabled="true" label="請選擇類別"></form:option>
							<form:option  value="1" class="hehe" label="最新活動" id="newest"></form:option>
							<form:option  value="3" class="hehe" label="活動即將開始" id="coming"></form:option>
						</form:select>
						<div id="categorycatch"></div>
					</div>
				</div>
				

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						<spring:message code='spring.addProduct.form.image.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="productImage" path="productImage" type='file'
							class='form:input-large' />
					</div>
				</div>
 



				<div class="form-group" style="display: none">
					<label class='control-label col-lg-2 col-lg-2' for="createTime">
						活動報名時間</label>
					<div class='col-lg-10'> 
						<form:input path="createTime" type='text'
							class='form:input-large' id="starttime" value="4" />
					</div> 
				</div> 




				<div class="form-group" style="width: 30%; display: inline-block">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="返回" href="../allActivityM" />
					</div>
				</div>
 


				<div class="form-group"
					style="width: 30%; display: inline-block; float: right">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出"  />
					</div>
				</div>
				<div id="happy"></div>
		
				
			
			</fieldset>
		</form:form>
	</section> 
 
</body>
	<script>
  
	
	
	$("#startTime").blur(function(){
		var x = $("#startTime").val();
		var z = x.replace("/" + x.substr(5,1) + "/", "/" + (parseInt(x.substr(5,1))+1) + "/")
		console.log(z);
		document.getElementById('endTime').setAttribute("value", z);
		document.getElementById('endTime').innerHTML = z;
	}); 
	
	
	
	var getxvalue = document.getElementById('starttime').getAttribute("value");
	console.log("starttime 的value  = " + getxvalue);
	
	
	
	function changeStatus(){
		
		 var date = new Date();
		  document.getElementById('happy').innerHTML = M;
		  var xx = document.getElementById('happy').innerHTML;
		  var yy = document.getElementById('delay2').setAttribute("value",M);
		  console.log("哈哈是 " + xx)
		  console.log("哈哈是 " + yy)
		alert("載入資訊");
		
		var x = $("#startTime").val();
		var y = $("#startTime").val();
		document.getElementById('today').setAttribute("value",y +"/"+ M +"/"+d); 
		
		
		
	}
	
	
	
	</script>
	


</html>


