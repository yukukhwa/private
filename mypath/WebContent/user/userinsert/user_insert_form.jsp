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
			회원가입을 환영합니다.<br><br>
			<% String send_id = request.getParameter("send_id");%>
			<fieldset>		
				<legend>아이디중복확인</legend>
				<form action=" <%= request.getContextPath()  %>/user/userinsert/id_check_pro.jsp" method="post"><br>
					아이디 :	<input type="text" name="m_id" autofocus>  
							<!-- <button onclick="location='id_check_pro.jsp" type="button" value="아이디중복체크"></button><br>  -->
							<%-- <a href="<%= request.getContextPath() %>/login/logout.jsp?<%= ??? %>">아이디중복체크</a> --%>
							<input type="submit" value="확인">
				</form>	
			</fieldset><br>
			<fieldset>
				<legend>가입정보</legend>
				<form action=" <%= request.getContextPath()  %>/user/userinsert/user_insert_pro.jsp" method="post"><br>
					아이디 :	<input type="text" name="m_id" value=<%= send_id%>><br>
					비밀번호 :	<input type="password" name="m_pw"><br>
					권한 :	<input type="radio" name="m_level" value="마스터" >마스터
							<input type="radio" name="m_level" value="스탭">스탭
							<input type="radio" name="m_level" value="제휴">제휴
							<input type="radio" name="m_level" value="회원" checked>회원<br>
					이름 :	<input type="text" name="m_name"><br>
					성별 :	<input type="radio" name="m_gender" value="남">남
							<input type="radio" name="m_gender" value="여">여<br>
					휴대폰 :	<input type="text" name="m_phone"><br>
					이메일 :	<input type="text" name="m_email"><br>
					<!-- 가입일은 입력받지 않고 자동으로 DB에 세팅됨. -->
					<br><br><input type="submit" value="가입완료">
				</form>
			</fieldset>
		</div>
		<%@ include file="/module/footer.jsp" %>		
	</div>
</body>
</html>