<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
	<title>user_insert_form.jsp</title>
</head>
<body>
	<div id="wrapper">		
		<%@ include file="/module/header.jsp" %>
		<%@ include file="/module/nav.jsp" %>	
		<div id="article">
			ȸ�������� ȯ���մϴ�.<br><br>
			<% String send_id = request.getParameter("send_id");%>
			<fieldset>		
				<legend>���̵��ߺ�Ȯ��</legend>
				<form action=" <%= request.getContextPath()  %>/user/userinsert/id_check_pro.jsp" method="post"><br>
					���̵� :	<input type="text" name="m_id" autofocus>  
							<!-- <button onclick="location='id_check_pro.jsp" type="button" value="���̵��ߺ�üũ"></button><br>  -->
							<%-- <a href="<%= request.getContextPath() %>/login/logout.jsp?<%= ??? %>">���̵��ߺ�üũ</a> --%>
							<input type="submit" value="Ȯ��">
				</form>	
			</fieldset><br>
			<fieldset>
				<legend>��������</legend>
				<form action=" <%= request.getContextPath()  %>/user/userinsert/user_insert_pro.jsp" method="post"><br>
					���̵� :	<input type="text" name="m_id" value=<%= send_id%>><br>
					��й�ȣ :	<input type="password" name="m_pw"><br>
					���� :	<input type="radio" name="m_level" value="������" >������
							<input type="radio" name="m_level" value="����">����
							<input type="radio" name="m_level" value="����">����
							<input type="radio" name="m_level" value="ȸ��" checked>ȸ��<br>
					�̸� :	<input type="text" name="m_name"><br>
					���� :	<input type="radio" name="m_gender" value="��">��
							<input type="radio" name="m_gender" value="��">��<br>
					�޴��� :	<input type="text" name="m_phone"><br>
					�̸��� :	<input type="text" name="m_email"><br>
					<!-- �������� �Է¹��� �ʰ� �ڵ����� DB�� ���õ�. -->
					<br><br><input type="submit" value="���ԿϷ�">
				</form>
			</fieldset>
		</div>
		<%@ include file="/module/footer.jsp" %>		
	</div>
</body>
</html>