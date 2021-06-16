<%
	session.invalidate();
	//session.setAttribute("login",null);
	response.sendRedirect("/member/login.jsp");
%>