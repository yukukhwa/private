<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ykh.dao.MemberDAO" %>
<%	
	String S_ID = (String)session.getAttribute("S_ID");
	MemberDAO mdao = new MemberDAO();
	mdao.mDelete(S_ID);
%>
	<script type="text/javascript">
	alert('Å»ÅðµÇ¾ú½À´Ï´Ù.');
	location.href="<%= request.getContextPath()%>/index.jsp";
	</script>