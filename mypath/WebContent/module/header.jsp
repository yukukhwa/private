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
		<a href="<%=request.getContextPath()%>/index.jsp">Ȩ</a>
		<a href="<%=request.getContextPath()%>">����</a> 
		<a href="<%=request.getContextPath()%>">�̺�Ʈ</a> 
		<a href="<%=request.getContextPath()%>">���</a> 
		<a href="<%=request.getContextPath()%>">����</a>
		<%
			if ((String) session.getAttribute("S_ID") != null) {
		%>
		<a href="<%=request.getContextPath()%>/mypage/my_page.jsp">����������</a> 
		<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a>
		<%
			} else if ((String) session.getAttribute("S_NAME") != null) {
		%>
		<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a>
		<%
			} else {
		%>
	</div>
	<div class="t2">
		<a href="<%=request.getContextPath()%>/user/userinsert/user_insert_form.jsp">ȸ������</a>
		<a href="<%=request.getContextPath()%>/login/login_form_before.jsp">�α���</a>
		<%
			}
		%>	
	</div>