<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/user/usersearch/user_search_list.jsp" method="post">
	<select name="choice">
	    <option value="m_level">ȸ�����</option>
	    <option value="m_id">���̵�</option>
	    <option value="m_name">�̸�</option>
	    <option value="m_gender">����</option>
	    <option value="m_phone">����ȣ</option>
	    <option value="m_email">�̸���</option>
	    <option value="m_date">������</option>
	</select>
	<input type="text" name="keyword">
	<input type="date" name="startDate"> ~ <input type="date" name="endDate">
	<input type="submit" value="�˻�">
</form>