<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ykh.login.loginDAO" %>
<%@ page import = "kr.or.ykh.dto.MemberDTO" %>
<%@ page import = "kr.or.ykh.dto.NoneMemberDTO" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	
	loginDAO ldao = new loginDAO();
	int result = 0;
	if(id != null & pw != null) {
		result = ldao.logincheck(id, pw);
	} else if(name != null & phone != null) {
		result = ldao.noneuserlogincheck(name, phone);
	}	
	System.out.println(result);
	
	MemberDTO m = ldao.mGetForSession(id);
	NoneMemberDTO nonem = ldao.nonemGetForSession(name);

	if(result==1){		
		if(m != null) {
			session.setAttribute("S_ID", m.getM_id());
			session.setAttribute("S_NAME", m.getM_name());
			session.setAttribute("S_LEVEL", m.getM_level());
		}else if(nonem != null) {
			session.setAttribute("S_NAME", nonem.getName());
			session.setAttribute("S_PHONE", nonem.getPhone());
			session.setAttribute("S_LEVEL", nonem.getLevel());
		}
%>
		<script type="text/javascript">
			alert('로그인성공');
			location.href="<%= request.getContextPath()%>/login/login_seccess.jsp";
		</script>
<%	
	}else if(result==2){
%>
		<script type="text/javascript">
			alert('비번불일치');
			location.href="<%= request.getContextPath()%>/login/login_form_before.jsp";
		</script>
<%		
	}else if(result==3){
%>
		<script type="text/javascript">
			alert('아이디불일치');
			location.href="<%= request.getContextPath()%>/login/login_form_before.jsp";
		</script>
<%			
	}
%>