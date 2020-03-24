<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<script
 src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<link rel="stylesheet"
 href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
 href='${pageContext.request.contextPath}/css/movie.css' type="text/css" />
<title>TaiwanFilms</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
<style>
body {
 background: white;
}

.activity-content{
 width: 100%;
 padding:10px;
 border-radius:10px;
 margin:10px;
 font-weight: bold;
 background: white;
 display: inline-block; 
 height: 100px;
}

.activity-content-show{
 width: 100%;
 padding:10px;
 border-radius:10px;
 margin:10px;
 font-weight: bold;
 display: inline-block;
}

.allActivityM-width {
 width: 25%;
 height: 200px;
 display: inline-block;
}


.acitivityUpdateWidth{
 width:21%;
 padding:20px;
 display: inline-block;
 vertical-align:top; 
 text-align: center;
 color: black;
 
}

.activityUpdateButton{
 width: 7%;
 display:inline-block;
 margin-top:12px;
 text-align: center;  
 vertical-align: top;
 padding-top: 5px;
}

.activityUpdateButtonStyle{
 width:100%;
 color:white;
 background-color:red;
 padding:3px;
 border-radius:3px
}

</style> 
</head>
<body> 
 <jsp:include page="../backstage.jsp" />
 
  
	<section class="container" style="position:absolute;left: 17%;width: 80%;padding-top: 100px">
		<div class="category-content">     
			<h1 style="text-align: center;margin: 0">活動分類頁面(員工後台)</h1>       
 			<a href="activitiesM"> 
				<div style="position:relative;width:100%;font-weight: bold;color:black;display: inline-block;text-align:right">回到分類頁面</div>
			</a>  
			<div class="activity-content-show">  
				<div class="acitivityUpdateWidth">活動照片</div> 
				<div class="acitivityUpdateWidth">活動主題</div>
				<div class="acitivityUpdateWidth">活動廠商</div>
				<div class="acitivityUpdateWidth">活動開始時間</div>
				<div class="activityUpdateButton">
					<div class="activityUpdateButtonStyle">上架</div>
				</div> 
			</div> 
			<c:forEach var='activity' items='${activities}'>
				<c:if test="${activity.category == '1' }">
					<c:if test="${activity.status == '1' }">
						<a href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style"> 
							<a href="<spring:url value='/activityM/${activity.activityId}' />">
									<div class="activity-inner"
										data-number="${activity.activityWatched}">
										<div class="activity-content">       
											<div class="activityThumb"
										style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 80px;width:20%;display: inline-block;	">
								 	</div> 
											<div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
											<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
											<div class="acitivityUpdateWidth">${activity.startTime}</div>
											<div class="activityUpdateButton"><a href="<spring:url value='/update/activities/${activity.activityId}' />"
													class="btn btn-primary"> <span
													class="glyphicon-info-sigh glyphicon"></span>編輯 
												</a>  
											</div>  
										</div> 	
									</div>    
								</a>
							</a>
						</c:if> 
				</c:if>
			</c:forEach>

   <div class="activity-content-show">
    <div class="acitivityUpdateWidth">活動照片</div>
    <div class="acitivityUpdateWidth">活動主題</div>
    <div class="acitivityUpdateWidth">活動廠商</div>
    <div class="acitivityUpdateWidth">活動開始時間</div>
    <div class="activityUpdateButton">
     <div class="activityUpdateButtonStyle">即將上架</div>
    </div> 
   </div>
   <c:forEach var='activity' items='${activities}'>
    <c:if test="${activity.category == '3'}">
     <a href="<spring:url value='/activity?id=${activity.activityId}' />"
      class="anchor-style"> 
      <a href="<spring:url value='/activityM/${activity.activityId}' />">
        <div class="activity-inner"
         data-number="${activity.activityWatched}">
         <div class="activity-content">       
          <div class="activityThumb"
         style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 80px;width:20%;display: inline-block; ">
        </div> 
          <div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
          <div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
          <div class="acitivityUpdateWidth">${activity.startTime}</div>
          <div class="activityUpdateButton"><a href="<spring:url value='/update/activities/${activity.activityId}' />"
            class="btn btn-primary"> <span
            class="glyphicon-info-sigh glyphicon"></span>編輯 
           </a>  
          </div>  
         </div>  
        </div>    
       </a>
     </a> 
    </c:if>
   </c:forEach>


   <div class="activity-content-show">
    <div class="acitivityUpdateWidth">活動照片</div>
    <div class="acitivityUpdateWidth">活動主題</div>
    <div class="acitivityUpdateWidth">活動廠商</div>
    <div class="acitivityUpdateWidth">活動開始時間</div>
    <div class="activityUpdateButton">
     <div class="activityUpdateButtonStyle">活動下架</div>
    </div> 
   </div>
   
   <c:forEach var='activity' items='${activities}'>
    <c:if test="${activity.status == '0'}">
     <a href="<spring:url value='/activity?id=${activity.activityId}' />"
      class="anchor-style"> 
      <a href="<spring:url value='/activityM/${activity.activityId}' />">
        <div class="activity-inner"
         data-number="${activity.activityWatched}">
         <div class="activity-content">       
          <div class="activityThumb"
         style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 80px;width:20%;display: inline-block; ">
        </div> 
          <div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
          <div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
          <div class="acitivityUpdateWidth">${activity.startTime}</div>
          <div class="activityUpdateButton"><a href="<spring:url value='/update/activities/${activity.activityId}' />"
            class="btn btn-primary"> <span
            class="glyphicon-info-sigh glyphicon"></span>編輯 
           </a>  
          </div>  
         </div>  
        </div>    
       </a>
     </a> 
    </c:if>
   </c:forEach>
  </div>
 </section>




</body>
</html>