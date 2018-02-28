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
			<thead>검색리스트</thead>
		<% 
		
			if((String)session.getAttribute("S_LEVEL") == "마스터"){ 
		%>
			<tr>
				<td>등급</td><td>아이디</td><td>이름</td><td>성별</td><td>폰</td><td>이메일</td><td>가입일</td><td>수정</td><td>삭제</td>
			</tr>
		<%
			}	else { 
		%>
			<tr>
				<td>등급</td><td>아이디</td><td>이름</td><td>성별</td><td>폰</td><td>이메일</td><td>가입일</td><td>수정</td>
			</tr>
		<% 
			}			
			String choice = request.getParameter("choice");
			String keyword = request.getParameter("keyword");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			System.out.println(choice + "," + keyword + "," + startDate + "~" + endDate + "<---검색키워드");
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
						<td><a href="<%= request.getContextPath()%>/uupdate/user_update_form.jsp?send_id=<%= mdto.getM_id() %>">수정버튼</a></td>
				<% 
						if((String)session.getAttribute("S_LEVEL") == "마스터"){
				%>
						<td><a href="<%= request.getContextPath()%>/uupdate/user_update_form.jsp?send_id=<%= mdto.getM_id() %>">삭제버튼</a></td>
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