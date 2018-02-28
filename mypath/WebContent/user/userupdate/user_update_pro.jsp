<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ykh.dao.MemberDAO" %>
<%	request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mdto" class="kr.or.ykh.dto.MemberDTO" />
<jsp:setProperty property="*" name="mdto"/>
<%
	MemberDAO mdao = new MemberDAO();
	mdao.mUpdate(mdto);		
	response.sendRedirect(request.getContextPath() + "/Board/mypage/my_page.jsp");		
%>