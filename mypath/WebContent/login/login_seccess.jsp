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
	if(S_LEVEL.equals("비회원")) {
		S_NAME = (String)session.getAttribute("S_NAME");
		S_PHONE = (String)session.getAttribute("S_PHONE");
	}else {	
		S_NAME = (String)session.getAttribute("S_NAME");	
		S_ID = (String)session.getAttribute("S_ID");
	}	
	System.out.println(S_NAME + "," + S_LEVEL + "," + S_ID + "회원 세션정보");
	System.out.println(S_NAME + "," + S_LEVEL + "," + S_PHONE + "비회원 세션정보");
%>
	<div id="wrapper">		
	<%@ include file="/module/header.jsp" %>		
		<div id="nav">
			<%= S_NAME %>님은 <%= S_LEVEL %> 권한이 있습니다. &nbsp; <a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
			
		</div>		
		<div id="article">
			<p>로그인을 환영합니다.</p>
	<%
			if(S_LEVEL.equals("비회원")) {
	%>
				<p><a href="<%=request.getContextPath() %>/index.jsp">홈으로 가기</a></p>
	<%
			}else {
	%>
				<p><a href="<%=request.getContextPath() %>/mypage/my_page.jsp">마이페이지로 가기</a></p>
				<p><a href="<%=request.getContextPath() %>/index.jsp">홈으로 가기</a></p>
	<%
			}
	%>
			
		</div>
	<%@ include file="/module/footer.jsp" %>	
	</div>
</body>
</html>