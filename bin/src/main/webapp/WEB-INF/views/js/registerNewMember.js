function gerateOption(start, end, cur) {// 添加内容用，從start到end结束
      var s = "";// 用空變數來拼接
      for (var i = start; i <= end; i++) {
        if (i == cur)
          s = s + "<form:option selected='selected' value=" + i + ">" + i + "</form:option>";// selected表示预先選定該列表框
        else s = s + "<form:option value=" + i + ">" + i + "</form:option>";
      }
      return s;
    }
    function getDays(year, month) {// 根據年月 計算天數
      var d1 = new Date();
      var d2 = new Date();
      d1.setFullYear(year);
      d1.setMonth(month - 1);
      d1.setDate(1);
      d2.setFullYear(year);
      d2.setMonth(month);
      d2.setDate(1);// 利用月數差計算相差一個月
      return (d2 - d1) / 1000 / 60 / 60 / 24;// 把毫秒換成天數
    }
    var date = new Date();
    var yy = date.getFullYear(), mm = date.getMonth(), dd = date.getDate();// 取得現在的年、月、日
    var year = document.getElementById("y");// 把列表轉換成一個變數
    var month = document.getElementById("m");
    var day = document.getElementById("d");
    year.innerHTML = gerateOption(1919, 2050, yy);// 用innerHTML向列表框添加内容，調用gerateOption（）函数
    month.innerHTML = gerateOption(1, 12, mm);
    day.innerHTML = gerateOption(1, getDays(yy, mm), dd);// 日期特殊，先要算出月份對應的天数，調用getDays（）函数

    month.onchange = year.onchange = function () {// 實現練動
      var a = year.value, b = month.value;// 得到所選中的年、月列表框值
      day.innerHTML = gerateOption(1, getDays(a, b), dd);// 算出相對應的天数再添加
    }


    function checkID() {
      var patt = /^[A-Za-z]\d{9}$/;
      var test = "A123";
      // alert('您的身分是: '+document.getElementById("identity").value);
      // if(document.getElementById("identity").value == test){
      if (!patt.test(document.getElementById("identity").value)) {
        alert("您輸入的:" + document.getElementById("identity").value + "資料不正確");
      }
      // if(document.getElementById(identity).value == test){
      // console.log(document.getElementById('identity').value);
      // alert('請依照格式填寫: '+document.getElementById("identity").value +
		// '並非正確身分證字號');
      // }
    }

