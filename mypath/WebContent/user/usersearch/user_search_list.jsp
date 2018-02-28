<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.ykh.dao.MemberDAO" %>
<%@ page import = "kr.or.ykh.dto.MemberDTO" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>user_search_list.jsp</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />			
</head>
<body>
<div id="wrapper">
	<%@ include file="/module/header.jsp" %>
	<%@ include file="/module/nav.jsp" %>	 
	<div id="article">
	<%@ include file = "/user/usersearch/user_search_form.jsp" %>		
		<table width="100%" border="1">
			<thead>�˻�����Ʈ</thead>
		<% 
		
			if((String)session.getAttribute("S_LEVEL") == "������"){ 
		%>
			<tr>
				<td>���</td><td>���̵�</td><td>�̸�</td><td>����</td><td>��</td><td>�̸���</td><td>������</td><td>����</td><td>����</td>
			</tr>
		<%
			}	else { 
		%>
			<tr>
				<td>���</td><td>���̵�</td><td>�̸�</td><td>����</td><td>��</td><td>�̸���</td><td>������</td><td>����</td>
			</tr>
		<% 
			}			
			String choice = request.getParameter("choice");
			String keyword = request.getParameter("keyword");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			System.out.println(choice + "," + keyword + "," + startDate + "~" + endDate + "<---�˻�Ű����");
			MemberDAO mdao = new MemberDAO();
			if(choice != null & keyword != null & startDate != null & endDate != null) {
				ArrayList<MemberDTO> list = mdao.mSelectSearch(choice, keyword, startDate, endDate);
			
				for(MemberDTO mdto : list) {
				%>
					<tr>
						<td><%= mdto.getM_level() %></td>
						<td><%= mdto.getM_id() %></td>
						<td><%= mdto.getM_name() %></td>
						<td><%= mdto.getM_gender() %></td>
						<td><%= mdto.getM_phone() %></td>
						<td><%= mdto.getM_email() %></td>
						<td><%= mdto.getM_date() %></td>
						<td><a href="<%= request.getContextPath()%>/uupdate/user_update_form.jsp?send_id=<%= mdto.getM_id() %>">������ư</a></td>
				<% 
						if((String)session.getAttribute("S_LEVEL") == "������"){
				%>
						<td><a href="<%= request.getContextPath()%>/uupdate/user_update_form.jsp?send_id=<%= mdto.getM_id() %>">������ư</a></td>
					</tr>
				<%
					}
				}
			}
				//response.sendRedirect(request.getContextPath() + "/user/userlist/userlist.jsp");			
			%>				
		</table>
		</div>
		<%@ include file="/module/footer.jsp" %>
</div> 
</body>
</html>