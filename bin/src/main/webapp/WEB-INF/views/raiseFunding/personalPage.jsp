<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menuStyle.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalPage.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/UtilTool.js" ></script>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
</head>


<body>
<jsp:include page="../fragment/menu.jsp" />
    <div class="pageWrapper">   
        <div class="upper">
           	<h2>贊助記錄</h2>
            <P style="margin-top: 38px">在專案結束之前，您都可修改你的回饋寄送資訊，ATM 轉帳與超商付款請於繳費期限內繳款。逾期後訂單會自動消失。</P>
             <div style="text-align: left">已支持的項目</div>
        </div>
        <div class="down">
           
            <c:if test="${pcBeans!=null}">
            <c:forEach items="${pcBeans}"  var="pcBean">
            <div class="inner" id="project${pcBean.projBean.projectId}">
                <div class="projectThumb" style="background-image:url('${pageContext.request.contextPath}/getProject/photo/${pcBean.projBean.projectId}');">
                </div>
                <div class="project">
                    <p class="title">${pcBean.projBean.projectName}</p>
                    <p class="small-title">${pcBean.projBean.projDescript}</p>
                    <div class="content"><span >購買方案</span><span>$${pcBean.dpBean.donateMoney}</span></div>
                </div>
                <div class="downMeta">
                    <div class="wholePercent"></div>
                    <div class="realPercent" style="width:${pcBean.projBean.cfBean.percent}%"></div>
                </div>
                <div class="plan">
                    <span class="money">目前募得$${pcBean.projBean.cfBean.fundsNow}元</span> <span
                        class="percent">${pcBean.projBean.cfBean.percent}%</span> <span class="date">還剩
                        <strong class="dayCount" data-endDay="${pcBean.projBean.cfBean.dateEnd}"></strong>
                    </span>
                </div>
            </div>
            </c:forEach>
           </c:if>
        </div>


    </div>
    <jsp:include page="../fragment/footer.jsp" />
    <script>
    
    $(".inner").click(function(){
    	var url = "${pageContext.request.contextPath}/"+ $(this).attr("id");
    	window.location.replace(url);
    });
    
    $(".dayCount").each(function(){
		var dayCount = $(this).attr("data-endDay");
		console.log(DaysCountdown(dayCount));
		var result = DaysCountdown(dayCount);
		$(this).text(result);
	});
    
    function DaysCountdown(sLimitDay){
		var nowDate ,limitDay ,countDay,result;
		nowDate = new Date();
		limitDay = new Date(sLimitDay);
		result = limitDay - nowDate;
		if(result>0){
		countDay = parseInt( Math.abs(result) / 1000 / 60 / 60 / 24 );
		return "還剩"+countDay+"天";
		}
		return "已截止";
	}
    </script>
</body>
</html>