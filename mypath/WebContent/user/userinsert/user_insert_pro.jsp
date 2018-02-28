<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ykh.dao.MemberDAO" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mdto" class="kr.or.ykh.dto.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<% 	
	MemberDAO mdao = new MemberDAO();
	mdao.mInsert(mdto);	
%>
	<script type="text/javascript">
		alert('회원가입 완료');
		location.href="<%= request.getContextPath()%>/index.jsp";
	</script>