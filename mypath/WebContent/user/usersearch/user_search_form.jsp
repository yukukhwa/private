<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/user/usersearch/user_search_list.jsp" method="post">
	<select name="choice">
	    <option value="m_level">회원등급</option>
	    <option value="m_id">아이디</option>
	    <option value="m_name">이름</option>
	    <option value="m_gender">성별</option>
	    <option value="m_phone">폰번호</option>
	    <option value="m_email">이메일</option>
	    <option value="m_date">가입일</option>
	</select>
	<input type="text" name="keyword">
	<input type="date" name="startDate"> ~ <input type="date" name="endDate">
	<input type="submit" value="검색">
</form>