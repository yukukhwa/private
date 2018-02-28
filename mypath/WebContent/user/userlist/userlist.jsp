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
	<thead>��üȸ�� ����Ʈ <br></thead>
		<% if("������".equals((String)session.getAttribute("S_LEVEL"))){ %>
			<tr>
				<td>���</td><td>���̵�</td><td>�̸�</td><td>����</td><td>��</td><td>�̸���</td><td>������</td><td>����</td><td>����</td>
			</tr>
		<%}	else { %>
			<tr>
				<td>���</td><td>���̵�</td><td>�̸�</td><td>����</td><td>��</td><td>�̸���</td><td>������</td><td>����</td>
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
				<td><a href="<%= request.getContextPath()%>/user/userupdate/user_update_form.jsp?send_id=<%= m.getM_id() %>">������ư</a></td>
				<%
					if("������".equals((String)session.getAttribute("S_LEVEL"))) {%>
				<td><a href="<%= request.getContextPath()%>/user/userdelete/user_delete_pro.jsp?send_id=<%= m.getM_id() %>">������ư</a></td>						
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