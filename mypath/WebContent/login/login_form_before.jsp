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
			<h2>�α����Ͻʽÿ�.</h2>
			<p>ȸ�� Ȥ�� ��ȸ������<br>�α����� �� �ֽ��ϴ�.</p>
		</div>			
		<div id="article">
			<p>üũ�� �� ���ּ���!</p>
			<form name = "separation" action=" <%= request.getContextPath()  %>/login/login_form.jsp" method="post">
				<input type="radio" name=user value="ȸ��">ȸ��
				<input type="radio" name=user value="��ȸ��">��ȸ��<br><br>
				<input type="submit" value="�α����Ϸ� ����">
			</form>
		</div>
		<%@ include file="/module/footer.jsp" %>
</body>
</html>