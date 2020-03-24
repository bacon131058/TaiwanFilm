<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel=stylesheet type="text/css"
	href="${pageContext.request.contextPath}/css/createCss.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menuStyle1.css" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>  
<script>
<!-- 網頁就緒時執行的JS -->
	$(function() {
		$(".datepicker").datepicker({ minDate: new Date()});
		donateOptionElm();
		$("#dliverDate").val(
				$("#deliverYear").val() + "-" + $("#deliverMonth").val());
	});
</script>
</head>

<body>
	<jsp:include page="../fragment/backStageInclud.jsp" />
	<div id="createWrapper" class="wrapper createWrapper">
		<div class="createContainer">
			<section class="createMenu">
				<ul class="createMenuList">
					<li class="option1 opts selected">專案大綱</li>
					<li class="option2 opts" style="color: red;">專案內容</li>
					<li class="option3 opts" style="color: red;">贊助設定</li>
				</ul>
			</section>

			<section class="formSection">
				<form method="POST"
					action="${pageContext.request.contextPath}/submitProject"
					enctype="multipart/form-data" id="projectForm">
					<div class="active create-basic productlist form-group">
						<div class="createFormIntro partialWidthBlock">
							<p>在這個區塊您將填寫專案內容中最吸引人募資影片、封面圖片和專案說明。</p>
						</div>
						<div class="partialWidthBlock projectCardGroup">
							<div class="projectDataGroup">
								<h2>專案標題</h2>
								<input type="text" name="projectName">
								<P>一個好的標題應該要好記、好搜尋、吸引人想點進去看，並讓瀏覽者能在最短的時間內瞭解專案的核心理念。</P>
								<div class="introducForm">
									<h2>內容摘要</h2>
									<textarea name="projDescript" form="projectForm" rows="7"
										cols="40" maxlength="200"></textarea>
								</div>
								<div class="storyForm">
									<h2>動人的故事</h2>
									<textarea name="projStory" form="projectForm" rows="7"
										cols="40" maxlength="500"></textarea>
								</div>
								<p>故事訴說作者的理念，強調你的獨一無二之處，讓贊助人對你或你的專案好奇，願意更進一步了解專案。</p>
							</div>
							<div class="createProjectCard"></div>
							<h2>上傳專案圖片</h2>
							<span>專案區塊圖</span>&nbsp;<input type="file" name="photoStr"
								accept="image/jpeg,image/png,image/bmp" style="background-color: lightgray;"><br> 
								<span>故事介紹圖</span>&nbsp;<input type="file" name="photoStr2"
								accept="image/jpeg,image/png,image/bmp" style="background-color: lightgray;">
							<h2>專案影片 &nbsp; <span style="color:black;"> (注意某些私人youtube影片是不開放其他網站載入) </span></h2>

							<input type="text" name="vedio" style='width: 350px' placeholder="請輸入youtube影片連結網址">
							<h2>募資目標金額</h2>
							<p>
								<input type="number" max="99999999" min="0" name="fundsGoal" />
								元
							</p>
							<h2>募資開始與結束日期</h2>
							<p>
								開始日期: <input class="datepicker" name="dateBegin" />
							</p>
							<p>
								結束日期: <input class="datepicker" name="dateEnd" />
							</p>
						</div>
						<div id="submitAll">
							<input type="submit" value="送出專案"> <span>請先建立基本專案即可新增其他內容</span><BR>
							<input type="reset" value="取消專案">
						</div>
					</div>
				</form>

				<div class="create-info productlist form-group"></div>

			</section>

		</div>

	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/createProj.js"></script>

</body>

</html>