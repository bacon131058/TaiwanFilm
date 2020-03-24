<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form  method="GET" action="${pageContext.request.contextPath}/FuzzyQuery">

	<input class="query" type="text" name="keyword" placeholder="搜尋文章⋯">查詢會員

</form>
		<table border='1' cellpadding="3" cellspacing="1" >
			<tr>
			   <th width='56'>編號</th>
			   <th width='180'>信箱</th>
			   <th width='140'>姓名</th>
			</tr>
			<c:forEach var='member' items='${members}'>			
				<tr>
					<td style="text-align:center"><a
                        href="${pageContext.request.contextPath}/_01_register/modify/${member.memberId}">${member.memberId}</a></td>
					<td>${member.email}</td>
					<td>${member.memberName}</td>
					<td>	
				</tr>
			</c:forEach>
		</table>

</body>
</html>