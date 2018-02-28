<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ykh.dto.MemberDTO" %>
<%@ page import = "kr.or.ykh.dao.MemberDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
	<title>Insert title here</title>				
</head>
<body>	 
	<table width="100%" border="1">
	<thead>전체회원 리스트 <br></thead>
		<% if("마스터".equals((String)session.getAttribute("S_LEVEL"))){ %>
			<tr>
				<td>등급</td><td>아이디</td><td>이름</td><td>성별</td><td>폰</td><td>이메일</td><td>가입일</td><td>수정</td><td>삭제</td>
			</tr>
		<%}	else { %>
			<tr>
				<td>등급</td><td>아이디</td><td>이름</td><td>성별</td><td>폰</td><td>이메일</td><td>가입일</td><td>수정</td>
			</tr>
		<% } 
			request.setCharacterEncoding("euc-kr");
			MemberDAO mdao = new MemberDAO();
			ArrayList<MemberDTO> list = mdao.mSelectAll();
			for(MemberDTO m : list) {
		%>
			<tr>
				<td><%= m.getM_id()%></td>
				<td><%= m.getM_level()%></td>
				<td><%= m.getM_name()%></td>
				<td><%= m.getM_gender()%></td>
				<td><%= m.getM_phone()%></td>
				<td><%= m.getM_email()%></td>
				<td><%= m.getM_date()%></td>
				<td><a href="<%= request.getContextPath()%>/user/userupdate/user_update_form.jsp?send_id=<%= m.getM_id() %>">수정버튼</a></td>
				<%
					if("마스터".equals((String)session.getAttribute("S_LEVEL"))) {%>
				<td><a href="<%= request.getContextPath()%>/user/userdelete/user_delete_pro.jsp?send_id=<%= m.getM_id() %>">삭제버튼</a></td>						
				<%
					} 
				%>		
			</tr>
		<%		
			}
		%>	
	</table>
</body>
</html>