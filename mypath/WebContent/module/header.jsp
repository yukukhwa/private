<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />	
	<title>My path..header</title>
</head>
<body>
	<div class="header">
		<h1>MY PATH</h1>
	</div>
	<div class="t1">
		<a href="<%=request.getContextPath()%>/index.jsp">홈</a>
		<a href="<%=request.getContextPath()%>">공지</a> 
		<a href="<%=request.getContextPath()%>">이벤트</a> 
		<a href="<%=request.getContextPath()%>">경로</a> 
		<a href="<%=request.getContextPath()%>">문의</a>
		<%
			if ((String) session.getAttribute("S_ID") != null) {
		%>
		<a href="<%=request.getContextPath()%>/mypage/my_page.jsp">마이페이지</a> 
		<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
		<%
			} else if ((String) session.getAttribute("S_NAME") != null) {
		%>
		<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
		<%
			} else {
		%>
	</div>
	<div class="t2">
		<a href="<%=request.getContextPath()%>/user/userinsert/user_insert_form.jsp">회원가입</a>
		<a href="<%=request.getContextPath()%>/login/login_form_before.jsp">로그인</a>
		<%
			}
		%>	
	</div>