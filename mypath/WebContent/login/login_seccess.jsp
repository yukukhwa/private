<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
	<title>Insert title here</title>
</head>
<body>
<%
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	String S_NAME = null;
	String S_PHONE = null;
	String S_ID = null;
	if(S_LEVEL.equals("��ȸ��")) {
		S_NAME = (String)session.getAttribute("S_NAME");
		S_PHONE = (String)session.getAttribute("S_PHONE");
	}else {	
		S_NAME = (String)session.getAttribute("S_NAME");	
		S_ID = (String)session.getAttribute("S_ID");
	}	
	System.out.println(S_NAME + "," + S_LEVEL + "," + S_ID + "ȸ�� ��������");
	System.out.println(S_NAME + "," + S_LEVEL + "," + S_PHONE + "��ȸ�� ��������");
%>
	<div id="wrapper">		
	<%@ include file="/module/header.jsp" %>		
		<div id="nav">
			<%= S_NAME %>���� <%= S_LEVEL %> ������ �ֽ��ϴ�. &nbsp; <a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
			
		</div>		
		<div id="article">
			<p>�α����� ȯ���մϴ�.</p>
	<%
			if(S_LEVEL.equals("��ȸ��")) {
	%>
				<p><a href="<%=request.getContextPath() %>/index.jsp">Ȩ���� ����</a></p>
	<%
			}else {
	%>
				<p><a href="<%=request.getContextPath() %>/mypage/my_page.jsp">������������ ����</a></p>
				<p><a href="<%=request.getContextPath() %>/index.jsp">Ȩ���� ����</a></p>
	<%
			}
	%>
			
		</div>
	<%@ include file="/module/footer.jsp" %>	
	</div>
</body>
</html>