<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/favicon.ico"/>
</head>
<body>

	<div style="text-align: center;">  
		<h1>${title}</h1>
		<p>${subtitle}</p>
	</div>
	
	<div>
			<iframe width="1700" height="800"
				src="https://www.youtube.com/embed/3x-aAwdpu5A?controls=0&amp;start=5&autoplay=1&mute=1"
				frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
		<br>

</body>
</html>