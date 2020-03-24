<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<head> 
<title>movie</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style>
label {
	color: #428bca;
	font-size: 16px;
}

input, select {
	height: 35px;
	border-radius: 5px;
}

textarea {
	border-radius: 5px;
}

input[type="checkbox"] {
	height: 20px;
	width: 20px;
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
</style>
</head>
<body>
	<jsp:include page="../backstage.jsp" />

	<section class="container"
		style="position: absolute; left: 17%; width: 80%; padding-top: 100px">
		<div class="category-content">
			<h1 style="text-align: center; margin: 0">新增電影</h1>
		</div>
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="movieBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='movieName'>
						電影名稱 </label>
					<div class="col-lg-10">
						<form:input id="movieName" path="movieName" type='text'
							class='inputLarge' value="五月天 人生無限公司" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='englishName'>
						英文名稱 </label>
					<div class="col-lg-10">
						<form:input id="englishName" path="englishName" type='text'
							class='inputLarge' value="LIFE" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='releaseDate'>
						上映日期 </label>
					<div class="col-lg-10">
						<form:input id="releaseDate" path="releaseDate" type='date'
							value="2019-05-24" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='director'>
						導演 </label>
					<div class="col-lg-10">
						<form:input id="director" path="director" type='text'
							class='inputLarge' value="仙草影像 、 陳奕仁" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='actor'>
						演員 </label>
					<div class="col-lg-10">
						<form:input id="actor" path="actor" type='text' class='inputLarge'
							value="阿信 、 怪獸 、 石頭 、 冠佑 、 瑪莎(Masa)" />
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
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='movieLength'>
						片長 </label>
					<div class="col-lg-10">
						<form:input id="movieLength" path="movieLength" type='text'
							class='inputLarge' value="1 時 52 分" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='ticketPrice'>
						票價 </label>
					<div class="col-lg-10">
						<form:input id="ticketPrice" path="ticketPrice" type='text'
							class='inputLarge' value="290" />
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
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='youtube'>
						影片連結 </label>
					<div class="col-lg-10">
						<form:input id="youtube" path="youtube" type='text'
							class='inputLarge'
							value='<iframe width="840" height="470" src="https://www.youtube.com/embed/hx7YRiFFQP0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='movieStory'>
						劇情簡介 </label>
					<div class="col-lg-10">
						<form:textarea id="movieStory" path="movieStory" rows="5"
							cols="30" class='inputLarge' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="fileImage">
						圖片 </label>
					<div class='col-lg-10'>
						<form:input id="fileImage" path="fileImage" type='file'
							class='inputLarge' />
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
	$(document)
			.ready(
					function() {
						$("#rate").val("普遍級 0+");
						$("#movieStory")
								.val(
										"《五月天人生無限公司》由怪獸、石頭、瑪莎、冠佑、阿信領銜主演，黃渤、梁家輝特別主演，415萬社員演員共同主演，仙草影像、陳奕仁執導。由「昨日歡樂街頭戰」揭開故事序幕，五月天化身五位具有超能力的救世英雄，組成一支菁英戰隊「第五分隊」，吉他手怪獸飾演紅色盔甲身手矯健的 Mr. Monster；吉他手石頭飾演堅硬如石的 Lonely Stone；鼓手冠佑飾演搞笑運氣又超好的十字弓射手 Mini Ming，就連蹲下撿錢都可以躲過一波攻擊；貝斯手瑪莎飾演尖酸幽默坐擁重裝軍火的地獄貓 Hell Kitty；主唱阿信則飾演有著魔法超能力，天才慧黠的 Honey Potter。五人歷經大戰後回到「今日魯蛇唱片行」，過著話當年的平凡生活，直到長官現身「重新召集大家」對抗剛烈的怪獸，看著「今日魯蛇唱片行」將成為攻擊範圍，「第五分隊」決定起身拯救地球，捍衛最初的音樂，重新訓練與迎戰，「人生無限公司」122個夜晚結束之後，五位英雄人物又何去何從？做了什麼？吃了多少火鍋？怪獸的自拍鏡頭又紀錄了哪些旅程呢？「人生無限公司」將在大銀幕繼續營業。");
						$("#type input").each(function() {
							if ($(this).val() == "劇情") {
								$(this).attr("checked", "checked");
							}
						});
					});
</script>
</html>