<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/thank1.css" />
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<style>


</style>
</head>
<body>
<jsp:include page="../fragment/menu.jsp" />

<div class="receiptWrapper">

<h2>感謝購買</h2>
   <div class="formWrapper">
        <div class="col-left">
    <table >
        <tr><th>收件人姓名</th><th>${pcBean.buyerName}</th></tr>
        <tr><td>郵遞區號</td><td>${pcBean.postNumber}</td></tr>
        <tr><td>收件地址</td><td>${pcBean.adress}</td></tr>
        <tr><td>連絡電話</td><td>${pcBean.phone}</td></tr>
        <tr><td>聯絡信箱</td><td>${pcBean.email}</td></tr>
        <tr><td>總金額</td><td>${pcBean.payAmount}</td></tr>       
    </table>
    </div>  
    <div class="col-right"><img src="${pageContext.request.contextPath}/image/QR.png"></div>
    </div>



<p>請至下列合作的超商進行付款</p>
<div class="marketPart"><img src="${pageContext.request.contextPath}/img/supermark/familymart.png">
<img src="${pageContext.request.contextPath}/img/supermark/ipon.png">
<img src="${pageContext.request.contextPath}/img/supermark/life.png">
<img src="${pageContext.request.contextPath}/img/supermark/ok.png">
</div>
</div>
<jsp:include page="../fragment/footer.jsp" />
<script>
setTimeout(function(){ 
	alert("即將跳轉回首頁");
 	window.location.replace("${pageContext.request.contextPath}/");
}, 3000); 
</script>
</body>
</html>