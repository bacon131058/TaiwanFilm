function DaysCountdown(sLimitDay){
	var nowDate ,limitDay , countDay,result;
	nowDate = new Date();
	limitDay = new Date(sLimitDay);
	result = limitDay - nowDate;
	if(result<=0)return "已截止";
	countDay = parseInt(Math.abs(result)/1000/60/60/24);
	return countDay;
	}


function formatNumber(str,glue){
	if(isNaN(str)){return NaN;
	}
	var glue = (typeof glue == 'string')? glue: ',';
	var digits = str.toString().split('.');
	
	var integerdigits = digits[0].split("");
	var threeDigits = [];
	while (integerdigits.length > 3){
		threeDigits.unshift(integerdigits.splice(integerdigits.length - 3 ,3).join(""));
	}
	threeDigits.unshift(integerdigits.join(""));
	digits[0] = threeDigits.join(glue);
	return digits.join(".");
	
}