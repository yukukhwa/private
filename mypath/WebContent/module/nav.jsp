<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

	<div id="nav">
		<%	
			String S_ID = (String)session.getAttribute("S_ID");
			String S_NAME = (String)session.getAttribute("S_NAME");
			String S_LEVEL = (String)session.getAttribute("S_LEVEL");
			if(S_LEVEL != null) {
		%>
				<%= S_NAME %>���� <%= S_LEVEL %> ������ �ֽ��ϴ�.<br><br>
				<a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
		<%
			}
		%>
	</div>