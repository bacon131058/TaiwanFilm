<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style type="text/css">
fieldset {
	border: 1px solid white;
	width: 80%;
	margin: auto;
}
</style>
<title>AddMessage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<style>
#messageBackground {
	background-image: url(${pageContext.request.contextPath}/img/wall1.jpeg);
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menuStyle.css"
	type="text/css">
</head>
<body>
	<jsp:include page="../fragment/menu.jsp"></jsp:include>
	<div id="messageBackground">
		<section>
			<div class="container">
				<h1 style="text-align: center; font-size: 40px">新增文章</h1>
			</div>
		</section>
		<hr
			style="height: 1px; border: none; color: #333; background-color: white;">
		<fieldset>
			<div class="toolBar">
				<form class="formArea" id="forArea" method="post"
					action="${pageContext.request.contextPath}/messages/add"
					enctype="multipart/form-data">
					<div style="font-size: 20px; padding: 10px 0px">分類</div>
					<div class="form-group">

						<select id="SelectID" name="messageCategory"

							style="font-size: 20px; width: 108px; height: 30px;">
							<option value="國片討論">國片討論
							<option value="募資討論">募資討論
						</select> <br>
					</div>

					<div  style="font-size: 20px;padding:10px 0px" >標題</div>
					<div class="col-lg-10">
						<input id="title" name="messageTitle" type='text' style="height:30px; width:600px ;font-size:15px ;height:30px"><br>
					</div>
					<div style="font-size: 20px;padding:10px 0px" >內文</div>
					<div style="margin: 0 auto; width: 100%;padding:10px 0px ;font-size:15px">
						<textarea id="content" name="messageContent"></textarea>

					</div>
					<div style="font-size: 2-px">
					<input name="messageLike" value="0" type="hidden" > 
					<input name="messageDelete" value="1" type="hidden" > <input
						type="submit" value="輸入" /> <input type="reset" value="重寫" /></div>
				</form>

				<button onclick="demo()">
				DEMO
				</button>
				
			</div>
		</fieldset>
	</div>
	<script>
		CKEDITOR.replace('editor');
		function demo(){
			
			var t ="電影集資新浪潮，國片正在崛起";	

			$("#title").val(t);
			$('#SelectID').get(0).selectedIndex = 1;
		}
		 $(document).ready(function() {
			   var editor = CKEDITOR.replace('content');
			   console.log("ready!");
			   CKEDITOR.instances.content.setData( '<p>談到臺灣電影集資計劃，最為人所知的臺灣電影集資非《看見台灣》露天首映會莫屬。</p><p>在2013年群眾集資還不盛行之際，《看見台灣》便以248萬，1235人贊助的超高紀錄達標，而在這兩年來沒有團隊能打破其紀錄。</p><p>而2015年除了是國際強片雲集的一年，也正是臺灣電影藉著群眾集資邁向新里程碑的重要時刻。</p><p>《看見台灣》的成功，代表了臺灣對於土地認同的意識崛起，同時也為紀錄片集資掀起了新浪潮。</p><p>從今年初的《行者》發行募資計劃到現正熱烈集資中的《老鷹想飛》、《灣生回家》，不論是電影製作團隊或發行團隊，皆跳脫過去以戲院為主體、以票房為導向的傳統行銷模式。透過網路議題行銷、特定社群群經營與口碑發酵的方式，讓群眾集資成為最熱血的起跑點，募集更不單單只是資金，更是傳播理念的力量。</p><p></p><p>為什麼紀錄片需要集資？</p><p>過去紀錄片的製作發行礙於資金募集不易，而在後期發行宣傳之際，沒有足夠行銷資源可運用；更常因被戲院設定在小眾市場、沒有票房保證的情況下，面對國際大片的來勢洶洶，無法與戲院爭取上映廳數與場次，更別提全台各個戲院的上映機會。</p><p>藉由群眾集資的成功紀錄，電影團隊有了更強而有力的斡旋本事，紀綠片的群眾集資計劃通常透過電影交換券的提前販售，結合獨家的周邊商品。</p><p>且因紀錄片主題通常聚焦於特定議題，例如：</p><p>•行者 —— 十年磨一劍，林麗珍老師與無垢舞蹈劇場的歷練紀錄。</p><p>•老鷹想飛 —— 二十年來守護老鷹的生態記錄。</p><p>•灣生回家 —— 一段落葉歸根，台日關係的美好情誼。</p><p>這些議題本身就累積了大量的關注者，再透過不斷團隊長期深耕的社群經營，讓粉絲能透過參與集資計劃，成為第一批的支持者，更及早在上映初期就兌換交換券，讓口碑效應及早蔓延。除了達到戲院期待的票房，也能穩定長期上映，甚至增加更多戲院願意放映的機會，讓全台民眾的都有機會觀賞。</p><p>只有紀錄片適合群眾集資？</p> <p>除了紀錄片集資外，最近劇情片的集資計劃崛起也蓄勢待發，雖然不如紀錄片擁有高度的議題性與社群黏著度，商業劇情片仍藉由特殊的活動或創意商品殺出了另一片天地，打破傳統臺灣人對於電影集資的既定印象。</p><p>像是藉著台北電影節映後蔓延的口碑效應，大膽地推出戶外星空首映演唱會的《太陽的孩子》，不但緊扣電影中「回歸土地」的核心議題，募集人心的理念更引起關注原住民與土地議題的社群的分享與支持。</p><p>另外還有搭上鬼月節慶的《紅衣小女孩》，則是利用電影上映之前，以獨創的創意商品，如熱感應卡、手指餅乾等，再搭配系列體驗活動，密室脫逃、夜遊等，希望打造出不同於過去電影的傳統行銷，以豐富的內容帶給觀眾刺激的五感體驗。</p>' );
			   console.log(CKEDITOR.instances.content.getData());
			  });
		 

	</script>
</body>
</html>
