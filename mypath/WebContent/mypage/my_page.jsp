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
		<h1>���� ������</h1>
			<ul>
				<li><a href=" <%= request.getContextPath() %>/user/userupdate/user_update_form.jsp">�� ��������</a></li>
				<li><a href=" <%= request.getContextPath() %>/user/usersearch/user_search_list.jsp">ȸ���˻�(�����͸�)</a></li>
			</ul>
			<ul>
				<li>�� ������ ����Ʈ</li>
				<li>�� ������ �����</li>
				<li>�� ������ ����</li>
				<li>�� ������ ����</li>
				<li>���� ������ ����Ʈ</li>							
			</ul>					
		</div>
		<%@ include file="/module/article.jsp" %>
		<%@ include file="/module/footer.jsp" %>
	</div>
</body>
</html>