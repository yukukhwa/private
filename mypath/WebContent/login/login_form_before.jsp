<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
	<title>login_form_before.jsp</title>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/module/header.jsp" %>			
		<div id="nav">
			<h2>로그인하십시오.</h2>
			<p>회원 혹은 비회원으로<br>로그인할 수 있습니다.</p>
		</div>			
		<div id="article">
			<p>체크를 꼭 해주세요!</p>
			<form name = "separation" action=" <%= request.getContextPath()  %>/login/login_form.jsp" method="post">
				<input type="radio" name=user value="회원">회원
				<input type="radio" name=user value="비회원">비회원<br><br>
				<input type="submit" value="로그인하러 가기">
			</form>
		</div>
		<%@ include file="/module/footer.jsp" %>
</body>
</html>