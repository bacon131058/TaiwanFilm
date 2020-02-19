// 普通上傳圖片預覽
$("#donatePhoto").change(function() {
	$("#photoPre").html(""); // 清除預覽
	readURL1(this);
});

function readURL1(input) {
	if (input.files && input.files.length >= 0) {
		for (var i = 0; i < input.files.length; i++) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var img = $("<img width='300' height='200'>").attr('src',
						e.target.result);
				$("#photoPre").append(img);
			}
			reader.readAsDataURL(input.files[i]);
		}
	} else {
		var noPictures = $("<p>目前沒有圖片</p>");
		$("#photoPre").append(noPictures);
	}
}

// 贊助區生成日期的下拉選項
function donateOptionElm() {
	for (var i = 1; i < 13; i++) {
		var optionMonth = null;
		if (i < 10)
			optionMonth = $("<option value='" + "0" + i + "'>" + "0" + i
					+ "</option>");
		else
			optionMonth = $("<option value='" + i + "'>" + i + "</option>");
		$('#deliverMonth').append(optionMonth);
	}
	var date = new Date().getFullYear();
	for (var j = date; j < date + 4; j++) {
		var optionYear = $("<option value='" + j + "'>" + j + "</option>");
		$('#deliverYear').append(optionYear);
	}
}
$("#deliverYear").change(
		function() {
			$("#dliverDate").val(
					$("#deliverYear").val() + "-" + $("#deliverMonth").val());
			console.log($("#dliverDate").val())
		});

$("#deliverMonth").change(
		function() {
			$("#dliverDate").val(
					$("#deliverYear").val() + "-" + $("#deliverMonth").val());
			console.log($("#dliverDate").val())
		})

// ======================================================

// 將輸入的文字傳到上面的預覽區
function enterText() {
	if ($("#enterTable").val().length != 0) {
		var str = "<pre>";
		str += $("#enterTable").val();
		str += "</pre>";
		var allStr = $("#viewArea").html() + str;
		$("#viewArea").html(allStr);
		$("#enterTable").val("");
	}

}

// 將上傳的圖片傳到預覽區
var imageNum = 0;
// 限制圖片數量的參數
var maxImageNum = 4;

$(".imageUpload").change(function() {
	$(this).attr("name", "image" + imageNum);
	readURL(this);
})

// 上傳圖片的功能 和 製造下一個圖片表單
function readURL(input) {
	if (input.files && input.files.length >= 0) {
		for (var i = 0; i < input.files.length; i++) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var num = imageNum - 1;
				var img = $(
						"<img class='viewImage' width='600' height='400' id='image"
								+ num + "'>").attr('src', e.target.result);
				$("#viewArea").append(img);
			}
			reader.readAsDataURL(input.files[i]);
		}
		$(input).css("display", "none");
		imageNum++;
		if(imageNum<maxImageNum){
            var newInput = $("<input class='imageUpload' type='file'  name='' >");
            $(".formArea").append(newInput);
            $(".imageUpload").change(function () {
                $(this).attr("name", "image" + imageNum);
                readURL(this);
            })
            }
	}
}

// 清除INFO區塊的內容重新輸入
function resetForm() {
	$("#preViewArea").html("");
	$("#viewArea").css("display","block");
	$("#viewArea").html("");
	$(".formArea [type='file']").remove();
	$(".formArea")
			.append($("<input class='imageUpload' type='file' name='' >"));
	$(".imageUpload").change(function() {
		$(this).attr("name", "image" + imageNum);
		readURL(this);
	})
}