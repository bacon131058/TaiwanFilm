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
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<title>Document</title>
<link rel=stylesheet type="text/css"
	href="${pageContext.request.contextPath}/css/createCss.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menuStyle1.css" />
<link rel="stylesheet" 

	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/UtilTool.js"  ></script>

</head>

<body>
<jsp:include page="../fragment/backStageInclud.jsp" />
	<div id="createWrapper" class="wrapper createWrapper">
		<div class="createContainer">
			<section class="createMenu">
				<ul class="createMenuList">
					<li class="option1 opts selected">專案大綱</li>
					<li class="option2 opts">專案內容</li>
					<li class="option3 opts">贊助設定</li>
				</ul>
			</section>

			<section class="formSection">
				
					<div class="active create-basic productlist form-group">
					<form method="POST" action="${pageContext.request.contextPath}/updateSubmit"
					enctype="multipart/form-data" id="projectForm">
						<div class="createFormIntro partialWidthBlock">
							<p>在這個區塊您將填寫專案內容中最吸引人募資影片、封面圖片和專案說明。</p>
						</div>
						<div class="partialWidthBlock projectCardGroup">
							<div class="projectDataGroup">
								<h2>專案標題</h2>
								<input type="text" name="projectName" value="${ProjectBean.projectName}">
								<P>一個好的標題應該要好記、好搜尋、吸引人想點進去看，並讓瀏覽者能在最短的時間內瞭解專案的核心理念。</P>
								<div  class="introducForm" >
									<h2>內容摘要</h2>
									<textarea name="projDescript" form="projectForm" rows="7"
										cols="40" maxlength="200">${ProjectBean.projDescript}</textarea></div>
								<div class="storyForm">
									<h2>動人的故事</h2>
									<textarea name="projStory" form="projectForm" rows="7"
										cols="40" maxlength="500">${ProjectBean.projStory}</textarea>
								</div>
								<p>故事訴說作者的理念，強調你的獨一無二之處，讓贊助人對你或你的專案好奇，願意更進一步了解專案。</p>
							</div>
							<div class="createProjectCard"></div>
							<h2>上傳專案圖片</h2>
							<span>專案區塊圖:目前圖片${ProjectBean.photoFileName}</span><br><input type="file" name="photoStr"
								accept="image/jpeg,image/png,image/bmp"><br>
							<span>故事介紹圖:目前圖片${ProjectBean.photoFileName2}</span><br><input type="file" name="photoStr2" 
								accept="image/jpeg,image/png,image/bmp">
							<h2>專案影片 &nbsp; (注意某些私人youtube影片是不開放其他網站載入)</h2>
							
							<input type="text" name="vedio" style='width: 350px' placeholder="請輸入youtube影片連結網址"  value="https://www.youtube.com/watch?v=${ProjectBean.videoLink}">
							<h2>募資目標金額</h2>
							<p>
								<input type="number" max="99999999" min="0"
									name="fundsGoal" value="${ProjectBean.cfBean.fundsGoal}" />
								元
							</p>
							<h2>募資開始與結束日期</h2>
							<p>
								開始日期:
								<input class="datepicker" name="dateBegin" value="${ProjectBean.cfBean.dateBegin}"/>
							</p>
							<p>
								結束日期:
								<input class="datepicker" name="dateEnd" value="${ProjectBean.cfBean.dateEnd}"/>
							</p>
						</div>
						<div id="submitAll">
							<input type="submit" value="送出專案"><BR> <input
								type="reset" value="取消專案">
						</div>
						</form>
					</div>
				

				<div class="create-info productlist form-group"></div>

				<div class="create-reward productlist ">
					
					<div class="dplan-view" >
					<c:if test="${dpBeans!=null}">
						<c:forEach items="${dpBeans}" var="dpBean" >
							<div class="plan" id="donatePlan${dpBean.planId}" data-planId="${dpBean.planId}">
								<div>
									<h2 class="donateMoney dollar">$${dpBean.donateMoney}</h2>
								</div>
								<div class="projectThumb">
									<img
										src="${pageContext.request.contextPath}/getDonatePlan/photo/${dpBean.planId}">
								</div>
								<div class="planText">
									<div class="description">
										<c:out value="${dpBean.donateDescription}"
											default="單純贊助，不需回饋，小額贊助給予劇組鼓勵和支持。"></c:out>
									</div>
									<hr>
									<span class="shipping" data-shipping="${dpBean.shipping}">沒有運送服務</span>
									<div>
									<span class="deliverDate">預計寄送時間 ${dpBean.dliverDate}</span> 
									<span class="limit">限量 <strong>${dpBean.limitNum}</strong>份
</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					</div>
					<button id="create-user">新增贊助方塊</button>
					
					<!--         dialog-Form 隱藏的跳出視窗起始點               -->
					
					<div id="dialog-form" title="建立一個新的贊助方案">
						<p class="validateTips">所有表格都必須填寫</p>
						<div class="create-reward productlist form-group">
							<form method="POST" id='rewardPlan' action="${pageContext.request.contextPath}/createDonatePlan" 
							enctype="multipart/form-data" >
								<div class="rewardItem form-group">
									<div class="createCard">
										<label for="donateMoney">回饋金額，最低100元</label> 
										<input type="number" name="donateMoney" id="donateMoney" min="100"><br>
										<label for="donateDescription"><h2>內容摘要</h2></label>
										<textarea name="donateDescription" form="rewardPlan" rows="11"
											cols="40" >單純支持</textarea>
									</div>
									<div class="previewCard">
										<label for="photoPre">回饋封面</label>
										<div id="photoPre">
											<p>目前沒有圖片</p>
										</div>
										<label for="donatePhoto">請提供 JPEG、PNG 或 BMP 檔，圖片尺寸至少
											1024 x 768 Px； 並將檔案大小控制在 1MB 以內。</label> 
											<input type="file" id="donatePhoto" name="donatePhoto"
											accept="image/jpeg,image/png,image/bmp">
									</div>
									<div class="rewardInfo">
										<label for="shipping"><h2>運送區域</h2></label> <select name="shipping">
											<option value="InTaiwan">台灣本島</option>
											<option value="OutTaiwan">外島地區</option>
											<option value="Foreign">其他國家</option>
										</select> <label for="deliverYear">預計寄送時間</label> 
										<select id="deliverYear"></select> <select id="deliverMonth"></select>
										<input type="hidden" id="dliverDate" name="dliverDate" value=""> <br>
											<label for="limit"><h2>限量份數</h2></label> 
											<input  type="number" name="limit" id="limit" min="1" max="999999">
											<input type="hidden"  id="updateId" name="updateId" value="0">
										<input type="hidden" id="dphidden" name="projectId" value="${ProjectBean.projectId}">
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<div class="create-story productlist form-group">
					<h1>專案計畫描述</h1>
					<div class="projectDetail">
						<div class="textTable">
							<h2>輸入的文章預覽</h2>
							<span><input type="text" id="enterTittle"
								placeholder="請輸入主題標頭"></span><br>
							<div id="viewArea"></div>
							<div id="preViewArea">${infoBean.innerText}</div>
						</div>
						<div class="toolBar">
							<textarea name="" id="enterTable" cols="30" rows="10"
								placeholder="請在此輸入段落文章"></textarea>
							<br>
							<div class="buttonGroup"><button type="button" onclick="enterText()">送出段落</button>
							<form class="formArea" id="formArea" method="post"
								action="${pageContext.request.contextPath}/createPjInfo"
								enctype="multipart/form-data">
								<input type="hidden" name="projectId"
									value="${ProjectBean.projectId}"> <input
									type="hidden" id="textTittle" name="textTittle" value="">
								<input id="innerTesxt" type="hidden" name="innerText" value="">
								<input id="photoCount" type="hidden" name="photoCount" value="">
								<input class="imageUpload" type="file" name="">
							</form>
							<span>可插入圖片上限4張</span><br>
							<button id="formSubmit" type="button" onclick="formSubmit()">儲存結果</button>
							<button id="restForm" type="button" onclick="resetForm()">清除</button>
							</div>
						</div>

					</div>
				</div>
			</section>

		</div>

	</div>



	<script>
		var dataDpBeans = null;
		$(function() {
			$(".dollar").text(function(){
				$(this).text("$"+formatNumber($(this).text())) ;
			})
			//$("#preViewArea").find("img").a
			$(".datepicker").datepicker();
			
			//設定方案日期按鈕
			donateOptionElm();
			$("#dliverDate").val(
			$("#deliverYear").val() + "-" + $("#deliverMonth").val());
		
			
			
			//啟用方案彈出功能
			var dialog, limit = $("#limit"), donateMoney = $("#donateMoney"),
			allFields = $(
					[]).add(limit).add(donateMoney), tips = $(".validateTips");
			var url = $("#rewardPlan").attr('action');
			
			function updateTips(t) {
				tips.text(t).addClass("ui-state-highlight");
				setTimeout(function() {
					tips.removeClass("ui-state-highlight", 1500);
				}, 500);
			}
			
			function checkLength(o, n, min, max) {
				if (o.val().length > max || o.val().length < min) {
					o.addClass("ui-state-error");
					updateTips( n + "必須在" + min
							+ "到" + max + "之間");
					return false;
				} else {
					return true;
				}
			}
			
			
			//建立彈出視窗結構
			dialog = $("#dialog-form").dialog({
				autoOpen : false,
				height : 650,
				width : 800,
				modal : true,
				buttons : {
					"建立一個贊助專案" : addDonatePlan,
					"取消" : function() {
						dialog.dialog("close");
					}
					
				},
				close : function() {
					var form = document.getElementById("rewardPlan");
					form.reset();
					var noPictures = $("<p>目前沒有圖片</p>");
					$("#photoPre").html("").append(noPictures);
					allFields.removeClass("ui-state-error");
				}
			});
			
			form = dialog.find( "#rewardPlan" ).on( "submit", function( event ) {
			      event.preventDefault();
			      addDonatePlan();
			    });
			
			//彈出式視窗內的資料送進SERVER
			function addDonatePlan() {
				var valid = true;
				allFields.removeClass("ui-state-error");
				valid = valid && checkLength(donateMoney, "金額位數", 1, 6);
				valid = valid && checkLength(limit, "數量",1 , 6);
				if (valid) {
					console.log(formData);
					var form = document.getElementById("rewardPlan");
					var formData = new FormData(form);
					$.ajax({
						type:'post',
						url:url,  //  url = /createDonatePlan
						data: formData,
						dataType:false,
						cache:false,
						contentType: false,
						processData: false,
						success:function(data){	
							dataDpBeans = JSON.parse(data);
							dpPlanForEach(dataDpBeans);
							$( ".plan" ).on( "click", getPlanForm);
							$(".dollar").text(function(){
								$(this).text("$"+formatNumber($(this).text())) ;
							})
						},
						error:function(){
							alert("fail");
						}
					})
					$("#updateId").val("0"); // updateId是拿來檢查要新增還是更改的數字
					dialog.dialog("close");
				}
				
			}
			//回傳DPBEAN叫回跳出視窗
			function getPlanForm(){
				var url = "${pageContext.request.contextPath}/getDonatePlan/projId"+${ProjectBean.projectId}+
				"/actionId"+$(this).attr("data-planId");
				$.ajax({
					type:'get',
					url:url,
					dataType:"json",
					success:function(data){
						updateForm(data);
						dialog.dialog("open");
					},
					error:function(){
						alert("fail");
					}	
				})
			}

			$("#create-user").button().on("click", function() {
				dialog.dialog("open");
			});
			
			$( ".plan" ).on( "click", getPlanForm);
			
			// 點擊方案後會呼叫此方法設置表格內的資料
			function updateForm(dpBean){
				$("#donateMoney").val(dpBean.donateMoney);
				$("#donateDescription").text(dpBean.donateDescription);
				var img = $("<img width='300' height='200'>").attr('src',
						"${pageContext.request.contextPath}/getDonatePlan/photo/"+dpBean.planId
						);
				$("#photoPre").html("").append(img);
				$("#limit").val(dpBean.limitNum);
				$("#updateId").val(dpBean.planId);
				var deletePlan = $("<button type='button' data-delId='"+dpBean.planId+"' id='delPane'>刪除</button>")		
				$(".ui-dialog-buttonpane").append(deletePlan);
				$("#delPane").on("click",delPlan);
			}
			//刪除按鈕
			function delPlan(){
				alert($(this))
				var url = "${pageContext.request.contextPath}/delDonatePlan/projId"+${ProjectBean.projectId}+
				"/actionId"+$(this).attr("data-delId");
				$.ajax({
					type:'get',
					url:url,
					dataType:"json",
					success:function(dataDpBeans){
						console.log(dataDpBeans);
						dpPlanForEach(dataDpBeans);
						$( ".plan" ).on( "click", getPlanForm);
						$(".dollar").text(function(){
						$(this).text("$"+formatNumber($(this).text())) ;
						})
						$("button").remove("#delPane");
						$("#updateId").val("0");
						dialog.dialog("close");
					},
					error:function(){
						alert("fail");
					}	
				})
			}
		});
		
		//送出表單按鈕
		function formSubmit(){
			$("#preViewArea").html($("#viewArea").html());
			var count = imageNum;
			$("#viewArea").find("img").attr("src", "");
			$("#viewArea").css("display","none");
			var dataTittle = "" + $("#enterTittle").val();
			var dataHtml = "" + $("#viewArea").html();
			$("#textTittle").val(dataTittle);
			$("#innerTesxt").val(dataHtml);
			$("#photoCount").val(imageNum);
			var form = document.getElementById("formArea");
			var url = $("#formArea").attr("action");
			var formData = new FormData(form);
			$.ajax({
				type:'post',
				url:url,
				data: formData,
				dataType:false,
				cache:false,
				contentType: false,
				processData: false,
				success:function(){
					for(var i = 0 ; i<count;i++){
						var url =  "${pageContext.request.contextPath}/infoPhoto/"+${ProjectBean.projectId}+"/"+i;    
					$("#preViewArea #image"+i).attr("src", url);
					}
					alert("資料建立成功")
					
				},
				error:function(){
					alert("fail");
				}
			})
		}
		//分頁按鈕
		$('.option1').click(function() {
			$('.productlist').removeClass('active');
			$('.opts').removeClass('selected');
			$('.create-basic').addClass("active");
			$('.option1').addClass("selected");
		});

		$('.option2').click(function() {
			$('.productlist').removeClass("active");
			$('.opts').removeClass('selected');
			$('.create-story').addClass("active");
			$('.option2').addClass("actived");
		});

		$('.option3').click(function() {
			$('.productlist').removeClass("active");
			$('.opts').removeClass('selected');
			$('.create-reward').addClass("active");
			$('.option3').addClass("actived");
		});
		//重新掃回方案方塊回頁面
function dpPlanForEach(dpBeans){
	$(".dplan-view").html("");
	for(var dpBean of dpBeans){
		var dplan = $("<div class='plan' id='donatePlan"+dpBean.planId+"' data-planId='"+dpBean.planId+"'>"+
			"<div><h2 class='donateMoney dollar'>"+dpBean.donateMoney+"</h2></div>"+
			"<div class='projectThumb'><img src='${pageContext.request.contextPath}"+
			"/getDonatePlan/photo/"+dpBean.planId+"?t="+Math.random()+"'></div><div class='planText'><div class='description'>"+
			dpBean.donateDescription+"</div><hr><span class='shipping'"+ 
			"data-shipping='"+dpBean.shipping+"'>沒有運送服務</span><div>"+
			"<span class='deliverDate'>預計寄送時間 "+dpBean.dliverDate+"</span>"+
			"<span class='limit'>限量 <strong>"+dpBean.limitNum+"</strong>份</span></div></div></div>"
			)
								
		$(".dplan-view").append(dplan);
	}
}
//點擊方案方塊叫回原方案的資料進表格





	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/createProj.js"></script>
</body>

</html>
