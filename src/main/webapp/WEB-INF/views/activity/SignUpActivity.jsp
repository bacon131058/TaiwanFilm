<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

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
<%-- 	<div class="header">
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
	</div> --%>
			<jsp:include page="../fragment/top.jsp" />

			<div class="activityContent active" id="new">
				<c:forEach var='activity' items='${activity}'>
					<c:if test="${activity.category == '1'}">
						<a href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style">
								<a href="<spring:url value='/queryMyActivity/${activity.activityId}' />"> 
								<div class="activity-inner" id="${activity.activityId}" data-number="${activity.activityWatched}">		
									<div class="activityThumb"
										style="background-image: url('getPicture/${activity.activityId}');	">
									</div>				 
									<div class="activity-content"> 
										<p id="today"></p>
										<p class="activity-title"> ${activity.activityTitle}</p>
										<%-- <p class="activity-author">${activity.activityAuthor}</p> --%>
										<p class="activity-maincontent">${activity.activityMainContent}</p>
										<p class="getvalue"><i class="fas fa-eye"></i>${activity.activityWatched}</p>										
									</div> 
									<div class="downMeta"></div>
								</div>
							</a> 
						</a>
					</c:if>
				</c:forEach>
			</div>
 
</body>
	<script>
	function ShowTime(){
		  var date = new Date();
		  var y = date.getFullYear();
		  var M = (date.getMonth()+1);
		  var d = date.getDate();
		  var h = date.getHours();  
		  var m = date.getMinutes();
		  var s = date.getSeconds();
		document.getElementById('starttime').setAttribute("value",y +"/"+ M +"/"+d); 
		
		document.getElementById('now').setAttribute("value", y +"/"+ M +"/"+d);
		document.getElementById('now').innerHTML = "今日上架 :"+ M + "月"+ d +"日" ;
		
		document.getElementById('delay1').setAttribute("value", y +"/"+ M +"/"+(d+1)); 
		document.getElementById('delay1').innerHTML = "延後一天	 :"+ M + "月"+ (d+1) +"日"; 
		
		
		document.getElementById('delay2').setAttribute("value",y +"/"+ M +"/"+(d+3));
		document.getElementById('delay2').innerHTML = "延後三天	 :"+ M + "月" + (d+3) + "日";
		document.getElementById('delay3').setAttribute("value",y +"/"+ M +"/"+(d+7));
		document.getElementById('delay3').innerHTML = "延後一週 	:"+ M + "月"+ (d+7) + "日" ;
		document.getElementById('delay4').setAttribute("value",y +"/"+ (M+1) +"/"+d);
		document.getElementById('delay4').innerHTML = "延後一個月:"+ (M+1) +"月"+d + "日"; 
		 
		setTimeout('ShowTime()',100000)
	}     
	
	
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


