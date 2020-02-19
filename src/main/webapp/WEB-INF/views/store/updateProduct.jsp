<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<style type="text/css">
label








:not




 




(
#fake




 




)
{
color








:




 




#428bca








;
font-size








:




 




16
px








;
}
input[type="checkbox"] {
	height: 20px;
	width: 20px;
}

input, select {
	height: 35px;
	border-radius: 5px;
}

textarea {
	border-radius: 5px;
}

span {
	font-size: 16px;
}

.inputLarge {
	width: 500px;
}

.category-content {
	margin-bottom: 50px;
}

fieldset {
	padding-left: 170px;
}

label {
	position: relative;
}

#fileImage {
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

#btn {
	margin-right: 5px;
	height: 23px;
	border-radius: 0px;
}

#text {
	font-weight: lighter;
}
</style>
<title>Products</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>

	<jsp:include page="../backstage.jsp" />




	<section class="container"
		style="position: absolute; left: 17%; width: 80%; padding-top: 100px">

		<div class="category-content">
			<h1 style="text-align: center; margin: 0">商品修改</h1>
		</div>

		<!-- 三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="ProductBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='title'>
						商品 </label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type='text' class='inputLarge' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='author'>
						電影 </label>
					<div class="col-lg-10">
						<form:input id="author" path="author" type='text'
							class='inputLarge' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"
						for='productDescription'> 商品描述 </label>
					<div class="col-lg-10">
						<form:textarea id="productDescription" path="productDescription"
							rows="5" cols="30" class='inputLarge' />
					</div>
				</div>




				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類別</label>
					<div class='col-lg-10'>
						<%-- <form:input id="category" path="category" type='text'
							class='form:input-large' /> --%>
						<div class='col-lg-10'>
							<form:select style="margin-left: -13px;" path="category"
								class='form:input-large'>
								<form:option value="-1" label="請挑選" />
								<form:options items="${categoryList}" />
							</form:select>
						</div>
					</div>
				</div>




				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						價格</label>
					<div class='col-lg-10'>
						<form:input id="price" path="price" type='text' class='inputLarge' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="stock">
						庫存</label>
					<div class='col-lg-10'>
						<form:input id="stock" path="stock" type='text' class='inputLarge' />
					</div>
				</div>
				<%-- <div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="fileName">
						圖片名稱</label>
					<div class='col-lg-10'>
						<form:input id="fileName" path="fileName" type='text'
							class='form:input-large' />
					</div>
				</div> --%>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						圖片 </label>
					<div class='col-lg-10'>
						<form:input id="fileName" path="fileName" type='text'
							disabled="true"
							style="border: aliceblue;background: #f1f1f1;font-size:12px;"
							class='form:input-large' />
						<form:input id="productImage" path="productImage" type='file'
							class='inputLarge' />
						<div id="productImageAppend"></div>

					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage2">
						小圖(1) </label>
					<div class='col-lg-10'>
						<form:input id="fileName2" path="fileName2" type='text'
							disabled="true"
							style="border: aliceblue;background: #f1f1f1;font-size:12px;"
							class='form:input-large' />
						<input id="productImage2" name="productImage2" type='file'
							class='inputLarge' />
						<div id="productImage2Append"></div>
					</div>

				</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage3">
						小圖(2) </label>
					<div class='col-lg-10'>
						<form:input id="fileName3" path="fileName3" type='text'
							disabled="true"
							style="border: aliceblue;background: #f1f1f1;font-size:12px;"
							class='form:input-large' />
						<input id="productImage3" name="productImage3" type='file'
							class='inputLarge' />
						<div id="productImage3Append"></div>
					</div>
				</div>



				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="status">
						狀態</label>
					<div class='col-lg-10'>
						<form:select class='form:input-large' id="status" path="status">
							<form:option selected="true" value="-1" disabled="true"
								label="請選擇" />
							<form:option value="上架中" label="上架" />
							<form:option value="下架" label="下架" />
						</form:select>
					</div>
				</div>



				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>


			</fieldset>
		</form:form>
	</section>



</body>

<script>
	$("#productImage").change(
			function() {
				//當檔案改變後，做一些事 
				$("#productImageAppend").append(
						"<img id='preview_productImage_img' src='' />");
				readURL(this); // this代表<input id="imgInp">
			});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview_productImage_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#productImage2").change(
			function() {
				//當檔案改變後，做一些事 
				$("#productImage2Append").append(
						"<img id='preview_productImage2_img' src='' />");
				readURL2(this); // this代表<input id="imgInp">
			});

	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview_productImage2_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#productImage3").change(
			function() {
				//當檔案改變後，做一些事 
				$("#productImage3Append").append(
						"<img id='preview_productImage3_img' src='' />");
				readURL3(this); // this代表<input id="imgInp">
			});

	function readURL3(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview_productImage3_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</html>