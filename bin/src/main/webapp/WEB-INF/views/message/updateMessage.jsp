<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯訊息</title>

<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">
<style type="text/css">
body {
	background: #f1f1f1;
}

fieldset {
	border: 1px solid white;
	width: 80%;
	margin: auto;
}

#messageBackground {
	background-image: url(${pageContext.request.contextPath}/img/wall1.jpeg);
}
</style>
<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
</head>
<body>
		<jsp:include page="../fragment/menu.jsp"></jsp:include>
	<div id="messageBackground">

		<section>
			<div class="container">
				<h1 style="text-align: center; font-size: 40px">編輯文章</h1>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: white;">
		<!--       三個地方要完全一樣 -->
		<fieldset>
			<form:form method='POST' modelAttribute="messageBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="toolBar">
					<div style="font-size: 20px; padding: 10px 0px">分類</div>
					<div class="form-group">
						<form:select path="messageCategory"
							style="font-size: 20px; width: 108px; height: 30px;">
							<form:option value="國片討論"></form:option>
							<form:option value="募資討論"></form:option>
							<%-- <options items="${categoryList}"></options> --%>
						</form:select>
					</div>
					<div style="font-size: 20px; padding: 10px 0px">標題</div>
					<div class="col-lg-10">
						<form:input id="messageTitle" path="messageTitle" type='text'  style="height:30px; width:600px ;font-size:15px ;height:30px" />
					</div>
					<div style="font-size: 20px; padding: 10px 0px">內文</div>
					<div style="margin: 0 auto; width: 100%; padding: 10px 0px">
						<form:textarea id="editor" path="messageContent" />
					</div>
					<div style="font-size: 20px">
						<input name="messageDelete" value="1" type="hidden"> <input
							type="submit" value="輸入" /> <input type="reset" value="重寫" />
					</div>
				</div>

			</form:form>
		</fieldset>
	</div>
	<script>
		CKEDITOR.replace('editor');
	</script>
</body>
</html>