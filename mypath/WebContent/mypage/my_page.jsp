<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
	<title>my_page.jsp</title>
</head>
<body>
	<div id="wrapper">		
		<%@ include file="/module/header.jsp" %>		
		<div id="nav">
		<h1>마이 페이지</h1>
			<ul>
				<li><a href=" <%= request.getContextPath() %>/user/userupdate/user_update_form.jsp">내 정보수정</a></li>
				<li><a href=" <%= request.getContextPath() %>/user/usersearch/user_search_list.jsp">회원검색(마스터만)</a></li>
			</ul>
			<ul>
				<li>내 여행경로 리스트</li>
				<li>내 여행경로 만들기</li>
				<li>내 여행경로 수정</li>
				<li>내 여행경로 삭제</li>
				<li>찜한 여행경로 리스트</li>							
			</ul>					
		</div>
		<%@ include file="/module/article.jsp" %>
		<%@ include file="/module/footer.jsp" %>
	</div>
</body>
</html>