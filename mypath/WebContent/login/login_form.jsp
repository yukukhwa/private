<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="/module/header.jsp" %>			
	<div id="nav">
		<h2>�α����Ͻʽÿ�.</h2>
		<p>ȸ�� Ȥ�� ��ȸ������<br>�α����� �� �ֽ��ϴ�.</p>
	</div>			
	<div id="article">
	<% 
		String user=request.getParameter("user");
		if(user.equals("ȸ��")) {
	%>
		<form action=" <%= request.getContextPath()  %>/login/login_pro.jsp" method="post" >
			<br>���̵�:	<input type="text" name="id"><br>
			<br>��й�ȣ:	<input type="password" name="pw"><br>
			<br><input type="submit" value="ȸ������ �α���">
		</form>
	<%
		}else{
	%>
		<form action=" <%= request.getContextPath()  %>/login/login_pro.jsp" method="post" >
			<br>�̸�:		<input type="text" name="name"><br>
			<br>�޴���:	<input type="text" name="phone" placeholder="���ڸ� �Է����ּ���"><br>
			<br><input type="submit" value="��ȸ������ �α���">
		</form>
		
	<% 
		}
	%>	
	</div>
	<%@ include file="/module/footer.jsp" %>
</body>
</html>