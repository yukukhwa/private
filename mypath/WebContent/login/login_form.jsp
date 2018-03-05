<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="/module/header.jsp" %>			
	<div id="nav">
		<h2>로그인하십시오.</h2>
		<p>회원 혹은 비회원으로<br>로그인할 수 있습니다.</p>
	</div>			
	<div id="article">
	<% 
		String user=request.getParameter("user");
		if(user.equals("회원")) {
	%>
		<form action=" <%= request.getContextPath()  %>/login/login_pro.jsp" method="post" >
			<br>아이디:	<input type="text" name="id"><br>
			<br>비밀번호:	<input type="password" name="pw"><br>
			<br><input type="submit" value="회원으로 로그인">
		</form>
	<%
		}else{
	%>
		<form action=" <%= request.getContextPath()  %>/login/login_pro.jsp" method="post" >
			<br>이름:		<input type="text" name="name"><br>
			<br>휴대폰:	<input type="text" name="phone" placeholder="숫자만 입력해주세요"><br>
			<br><input type="submit" value="비회원으로 로그인">
		</form>
		
	<% 
		}
	%>	
	</div>
	<%@ include file="/module/footer.jsp" %>
</body>
</html>