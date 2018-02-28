<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

	<div id="nav">
		<%	
			String S_ID = (String)session.getAttribute("S_ID");
			String S_NAME = (String)session.getAttribute("S_NAME");
			String S_LEVEL = (String)session.getAttribute("S_LEVEL");
			if(S_LEVEL != null) {
		%>
				<%= S_NAME %>님은 <%= S_LEVEL %> 권한이 있습니다.<br><br>
				<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
		<%
			}
		%>
	</div>