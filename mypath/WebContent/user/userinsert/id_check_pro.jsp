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
	System.out.println("�Ѿ�� m_id : " + m_id);
	
	if(m_id != ""){System.out.println("if���� m_id�� �ΰ��� �ƴҶ�");
	
		DriverDB driver = new DriverDB();
		conn = driver.driverDB();
		System.out.println("DB���Ἲ��");
		
		pstmt = conn.prepareStatement("Select * from tb_member where m_id=?");
		pstmt.setString(1, m_id);
		
		rs = pstmt.executeQuery();
		System.out.println("�������༺��" + rs);
		
		if(rs.next()){ //�ؽ�Ʈ�� ������ ���̵� �ߺ��̰�.
			System.out.println("if���� �ؽ�Ʈ=true�� ����");
		%>
			<script type="text/javascript">
			alert('�ߺ��� ���̵��Դϴ�.');
			location.href="<%= request.getContextPath()%>/user/userinsert/user_insert_form.jsp";
			</script>
		<%
		}
		else{ //�ؽ�Ʈ�� ������ ���̵� �ߺ��ƴ�. ����,���԰���.
			System.out.println("if���� �ؽ�Ʈ=false�� ����");
		%>
			<script type="text/javascript">
			alert('��밡���� ���̵��Դϴ�.');
			location.href="<%= request.getContextPath()%>/user/userinsert/user_insert_form.jsp?send_id=<%= m_id%>";
			</script>
	<%	
		}
	}else{
	%>
		<script type="text/javascript">
		alert('���̵� �Է����ּ���.');
		location.href="<%= request.getContextPath()%>/user/userinsert/user_insert_form.jsp";
		</script>
	<%
		}
	%>