<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<title>movie</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style>
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
</head>
<body>
	<jsp:include page="../backstage.jsp" />

	<section class="container"
		style="position: absolute; left: 17%; width: 80%; padding-top: 100px">
		<div class="category-content">
			<h1 style="text-align: center; margin: 0">修改電影</h1>
		</div>
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="movieBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<form:input id="movieId" path="movieId" type="hidden"
					value="${movie.movieId }" />
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='movieName'>
						電影名稱 </label>
					<div class="col-lg-10">
						<form:input id="movieName" path="movieName" type='text'
							class='inputLarge' value="${movie.movieName }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='englishName'>
						英文名稱 </label>
					<div class="col-lg-10">
						<form:input id="englishName" path="englishName" type='text'
							class='inputLarge' value="${movie.englishName }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='releaseDate'>
						上映日期 </label>
					<div class="col-lg-10">
						<form:input id="releaseDate" path="releaseDate" type='date'
							value="${movie.releaseDate }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='director'>
						導演 </label>
					<div class="col-lg-10">
						<form:input id="director" path="director" type='text'
							class='inputLarge' value="${movie.director }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='actor'>
						演員 </label>
					<div class="col-lg-10">
						<form:input id="actor" path="actor" type='text' class='inputLarge'
							value="${movie.actor }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='type'>
						類型 </label>
					<div class="col-lg-10" id="type">
						<form:checkbox path="type" value="動作" />
						<span>動作</span>
						<form:checkbox path="type" value="冒險" />
						<span>冒險</span>
						<form:checkbox path="type" value="喜劇" />
						<span>喜劇</span>
						<form:checkbox path="type" value="劇情" />
						<span>劇情</span>
						<form:checkbox path="type" value="動畫" />
						<span>動畫</span>
						<form:checkbox path="type" value="偵探推理" />
						<span>偵探推理</span>
						<form:checkbox path="type" value="紀錄" />
						<span>紀錄</span>
						<form:checkbox path="type" value="英雄" />
						<span>英雄</span><br>
						<form:checkbox path="type" value="警匪" />
						<span>警匪</span>
						<form:checkbox path="type" value="科幻" />
						<span>科幻</span>
						<form:checkbox path="type" value="懸疑" />
						<span>懸疑</span>
						<form:checkbox path="type" value="驚悚" />
						<span>驚悚</span>
						<form:checkbox path="type" value="溫馨" />
						<span>溫馨</span>
						<form:checkbox path="type" value="戰爭" />
						<span>戰爭</span>
						<form:checkbox path="type" value="勵志" />
						<span>勵志</span>
						<form:checkbox path="type" value="家庭" />
						<span>家庭</span>
					</div>
					<input id="typeHidden" type="hidden" value="${movie.type }" />
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='movieLength'>
						片長 </label>
					<div class="col-lg-10">
						<form:input id="movieLength" path="movieLength" type='text'
							class='inputLarge' value="${movie.movieLength }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='ticketPrice'>
						票價 </label>
					<div class="col-lg-10">
						<form:input id="ticketPrice" path="ticketPrice" type='text'
							class='inputLarge' value="${movie.ticketPrice }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='rate'>
						電影分級 </label>
					<div class="col-lg-10">
						<form:select path="rate" id="rate">
							<form:option value="-1">
								請選擇
							</form:option>
							<form:option value="普遍級 0+" />
							<form:option value="保護級 6+" />
							<form:option value="輔導級 12+" />
							<form:option value="輔導級 15+" />
							<form:option value="限制級 18+" />
						</form:select>
						<input id="rateHidden" type="hidden" value="${movie.rate }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='youtube'>
						影片連結 </label>
					<div class="col-lg-10">
						<form:input id="youtube" path="youtube" type='text'
							class='inputLarge' value="${movie.youtube }" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='movieStory'>
						劇情簡介 </label>
					<div class="col-lg-10">
						<form:textarea id="movieStory" path="movieStory" rows="5"
							cols="30" class='inputLarge' />
						<input id="storyHidden" type="hidden" value="${movie.movieStory }" />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="fileImage">
						圖片 </label>
					<div class='col-lg-10'>
						<label for="fileImage" id="fake"> <input type="button"
							id="btn" value="選擇檔案"><span id="text">${movie.fileName }</span>
							<form:input id="fileImage" path="fileImage" type='file'
								value="${pageContext.request.contextPath }/img/booking/${movie.fileName }" />
						</label>
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
		<br> <br> <br> <br>
	</section>

</body>
<script>
	$(document).ready(function() {
		$("#rate").val($("#rateHidden").val());
		$("#movieStory").val($("#storyHidden").val());
		$("#type input").each(function() {
			if ($("#typeHidden").val().indexOf($(this).val()) != -1) {
				$(this).attr("checked", "checked");
			}
		});
	});

	$("#fileImage").change(function() {
		$("#fileImage").css("opacity", "1");
		$("#text").css("opacity", "0");
		$("#btn").css("opacity", "0");
	})

	$("#btnAdd").click(function() {
		if (!confirm("確定要修改嗎?")) {
			return false;
		}
	});
</script>
</html>