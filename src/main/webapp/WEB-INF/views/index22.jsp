<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<link rel="stylesheet" href="css/movie.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<head>
<title>movie</title>
<style>
ul {
	list-style-type: none;
}

a {
	text-decoration: none;
}

h2 {

	text-align: left;
	color: #00bbd6;
	border-left: 3px solid #00bbd6;
	font-size: 18px;
	padding-left: 10px;
	
}

body {
	margin: 0;
}
</style>
</head>
<body>

	<jsp:include page="fragment/top.jsp" />


	<div class="main">
		<ul class="img">
			<li><div class="main-bg1" style="background-image: url('img/mymov1.jpg');background-position: 50% 20%"></div></li>
			<li><div class="main-bg2" style="background-image: url('img/mymov2.png')"></div></li>
			<li><div class="main-bg3" style="background-image: url('img/wei.jpg');background-position: 50% 50%"></div></li>
			<li><div class="main-bg4" style="background-image: url('img/test6.jpg')"></div></li>
		</ul>
	</div>



	<div class="section" id="category">
		
		<!-- 	<div class="change-category">
				<div class="change-menu">
					<div class="buttonBorder-active buttonBorder" id="new-button">最新發起</div>
					<div class="buttonBorder" id="trend-button">趨勢話題</div>
					<div class="buttonBorder" id="coming-button">即將開始</div>
					<div class="buttonBorder" id="end-button">即將結束</div>
				</div>
			</div> -->

		
			<jsp:include page="activity/activities.jsp" />
<!-- 		<div class="category-content active" id="new">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic05.jpg">
					</div>
					<div class="content">
						<h3>新新新新新</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic04.jpg">
					</div>
					<div class="content">
						<h3>新新新新新</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic03.jpg">
					</div>
					<div class="content">
						<h3>新新新新新</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic02.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic04.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
			</div>
			<div class="category-content" id="trend">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>我是最潮的</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
			</div>
			<div class="category-content" id="coming">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>來來來來來</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>來來來來來</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>來來來來來</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
			</div>

			<div class="category-content" id="end">
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>結束結束結束</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>結束結束結束</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>

				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>結束結束結束</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
				<div class="inner">
					<div class="projectThumb">
						<img src="img/popular-pic01.jpg">
					</div>
					<div class="content">
						<h3>測試文字</h3>
						<p>測試文字測試文字測試文字測試文字測試文字</p>
					</div>
					<div class="downMeta"></div>
				</div>
			</div>
		</div>
	</div> -->
	
	<div class="section" id="popular" style="background:white">
		<div class="width-limit">
			<h2>熱門項目</h2>
			<div class="inner">
				<div class="projectThumb">
					<img src="img/popular-pic01.jpg">
				</div>
				<div class="content">
					<h3>測試文字</h3>
					<p>測試文字測試文字測試文字測試文字測試文字</p>
				</div>
				<div class="downMeta"></div>
			</div>

			<div class="inner">
				<div class="projectThumb">
					<img src="img/popular-pic02.jpg">
				</div>
				<div class="content">
					<h3>測試文字</h3>
					<p>測試文字測試文字測試文字測試文字測試文字</p>
				</div>
				<div class="downMeta"></div>
			</div>

			<div class="inner">
				<div class="projectThumb">
					<img src="img/popular-pic03.jpg">
				</div>
				<div class="content">
					<h3>測試文字</h3>
					<p>測試文字測試文字測試文字測試文字測試文字</p>
				</div>
				<div class="downMeta"></div>
			</div>
		</div>
	</div>
	

	<div class="section" id="unique">
		<div class="width-limit">
			<h2>探索企劃</h2>
			<div class="unique-project">
				<div class="text">
					<div class="text-content">
						<p>黑膠募資專頁</p>
						<p>好感音樂</p>
					</div>
					<p>
						<a href="" class="more-btn">了解更多</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="section" id="siteCategory">
		<div class="category-square">
			<div>
				<img src="img/icon04.svg">
				<p>設計</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon01.svg">
				<p>音樂</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon02.svg">
				<p>影視</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon03.svg">
				<p>科技</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon04.svg">
				<p>藝術</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon03.svg">
				<p>休閒</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon02.svg">
				<p>公共</p>
			</div>
		</div>
		<div class="category-square">
			<div>
				<img src="img/icon04.svg">
				<p>在地</p>
			</div>
		</div>
	</div>

	<jsp:include page="fragment/top.jsp" />

</body>


<script type="text/javascript"></script>

<script>
	$('#new-button').click(function() {
		$('.category-content').removeClass("active active-bottom");
		$('#new').addClass("active");
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#new-button').addClass("buttonBorder-active");

	});
	$('#trend-button').click(function() {
		$('.category-content').removeClass("active active-bottom");
		$('#trend').addClass("active");
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#trend-button').addClass("buttonBorder-active");
	});
	$('#coming-button').click(function() {
		$('.category-content').removeClass("active active-bottom");
		$('#coming').addClass("active");
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#coming-button').addClass("buttonBorder-active");
	});
	$('#end-button').click(function() {
		$('.category-content').removeClass("active active-bottom");
		$('#end').addClass("active");
		$('.buttonBorder').removeClass("buttonBorder-active");
		$('#end-button').addClass("buttonBorder-active");
	});

	$('.myAccount').mouseover(function() {
		$('.register-btn').show();

	});
	$('.myAccount').mouseout(function() {
		$('.register-btn').hide();

	});

	$(document).ready(
			function() {
				var i = 0;
				var clone = $(".main .img li").first().clone();//克隆第一張圖片
				$(".main .img").append(clone);//復制到列表最後
				var size = $(".main .img li").size();

				for (var j = 0; j < size - 1; j++) {
					$(".main .num").append("<li></li>");
				}

				$(".main .num li").first().addClass("on");

				/*自動輪播*/

				var t = setInterval(function() {
					i++;
					move();
				}, 2000);

				/*鼠標懸停事件*/

				$(".main").hover(function() {
					clearInterval(t);//鼠標懸停時清除定時器
				}, function() {
					t = setInterval(function() {
						i++;
						move();
					}, 2000); //鼠標移出時清除定時器
				});

				/*鼠標滑入原點事件*/

				$(".main .num li").hover(function() {

					var index = $(this).index();//獲取當前索引值
					i = index;
					$(".main .img").stop().animate({
						left : -index * 1500
					}, 750);
					$(this).addClass("on").siblings().removeClass("on");
				});

				/*移動事件*/
				function move() {
					if (i == size) {
						$(".main .img").css({
							left : 0
						});
						i = 1;
					}
					if (i == -1) {
						$(".main .img").css({
							left : -(size - 1) * 1500
						});
						i = size - 2;
					}
					$(".main .img").stop().animate({
						left : -i * 1450
					/*圖片移動的長度*/
					}, 1500);/* 圖片移動的時間*/

					if (i == size - 1) {
						$(".main .num li").eq(0).addClass("on").siblings()
								.removeClass("on");
					} else {
						$(".main .num li").eq(i).addClass("on").siblings()
								.removeClass("on");
					}
				}
			});
</script>
</html>