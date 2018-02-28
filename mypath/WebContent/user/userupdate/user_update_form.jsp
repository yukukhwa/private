<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ykh.dao.MemberDAO" %>
<%@ page import = "kr.or.ykh.dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
	<title>user_update_form.jsp</title>
</head>
<body>
	<div id="wrapper">	
		<%@ include file="/module/header.jsp" %>
	<%
		String S_NAME = (String)session.getAttribute("S_NAME");
		String S_LEVEL = (String)session.getAttribute("S_LEVEL");
		String S_ID = (String)session.getAttribute("S_ID");
	%>
		<div id="nav">
			<%= S_NAME %>님은 <%= S_LEVEL %> 권한이 있습니다.<br>
			<br>
			<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
		</div>		 
		<div id="airticle">
		<%			
			MemberDAO mdao = new MemberDAO();
			MemberDTO mdto = mdao.mUpdateSelect(S_ID);			
		%>
			<form action="<%= request.getContextPath() %>/user/userupdate/user_update_pro.jsp" method="post">
			<table border="1">
			<tr>
				<td>아이디(수정X)</td>
				<td><input type="text" name="m_id" size="20" value="<%= mdto.getM_id() %>" readonly></td>
			<tr>
			<tr>
				<td>암호</td>
				<td><input type="text" name="m_pw" size="20" value="<%= mdto.getM_pw() %>"></td>
			<tr>
			<tr>
				<td>등급(수정X)</td>
				<td><input type="text" name="m_level" size="20" value="<%= mdto.getM_level() %>" readonly ></td>
			<tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="m_name" size="20" value="<%= mdto.getM_name() %>"></td>
			<tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="m_gender" size="20" value="<%= mdto.getM_gender() %>"></td>
			<tr>
			<tr>
				<td>폰번호</td>
				<td><input type="text" name="m_phone" size="20" value="<%= mdto.getM_phone() %>"></td>
			<tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="m_email" size="20" value="<%= mdto.getM_email() %>"></td>
			<tr>
			<tr>
				<td>가입일(수정X)</td>
				<td><input type="text" name="m_date" size="20" value="<%= mdto.getM_date() %>" readonly ></td>
			<tr>
			<tr>
				<td colspan="4"><input type="submit" value="수정완료"></td>
			</tr>
			</table>
			</form>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</div> 
</body>
</html>