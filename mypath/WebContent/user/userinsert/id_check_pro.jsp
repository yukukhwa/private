<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "kr.or.ykh.driverdb.DriverDB" %>
<%@ page import = "java.sql.ResultSet" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String m_id = null;
	m_id = request.getParameter("m_id");
	System.out.println("넘어온 m_id : " + m_id);
	
	if(m_id != ""){System.out.println("if문의 m_id가 널값이 아닐때");
	
		DriverDB driver = new DriverDB();
		conn = driver.driverDB();
		System.out.println("DB연결성공");
		
		pstmt = conn.prepareStatement("Select * from tb_member where m_id=?");
		pstmt.setString(1, m_id);
		
		rs = pstmt.executeQuery();
		System.out.println("쿼리실행성공" + rs);
		
		if(rs.next()){ //넥스트가 있으면 아이디 중복이고.
			System.out.println("if문의 넥스트=true문 실행");
		%>
			<script type="text/javascript">
			alert('중복된 아이디입니다.');
			location.href="<%= request.getContextPath()%>/user/userinsert/user_insert_form.jsp";
			</script>
		<%
		}
		else{ //넥스트가 없으면 아이디 중복아님. 생성,가입가능.
			System.out.println("if문의 넥스트=false문 실행");
		%>
			<script type="text/javascript">
			alert('사용가능한 아이디입니다.');
			location.href="<%= request.getContextPath()%>/user/userinsert/user_insert_form.jsp?send_id=<%= m_id%>";
			</script>
	<%	
		}
	}else{
	%>
		<script type="text/javascript">
		alert('아이디를 입력해주세요.');
		location.href="<%= request.getContextPath()%>/user/userinsert/user_insert_form.jsp";
		</script>
	<%
		}
	%>