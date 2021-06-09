<%--pageDirective.jxp --%>
<%@ page import="kr.or.kpc.dto.MemberDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.or.kpc.dao.MemberDao"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>
<%@ page session = "false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "utf-8">
		<title>Page Directive</title>
	</head>
	<body>
		<h1> 페이지 디렉티브</h1>
		<%
			MemberDao dao = MemberDao.getInstance();
			ArrayList<MemberDto> list = new ArrayList<>();
			list = dao.select(0,9);
			out.println("<ul>");
			for(MemberDto i : list){
				out.print("<li>"+i.getNum()+" "+i.getName()+" "+i.getAddr()+" "+i.getSex()+"</li><br>");
			}
			out.println("</ul>");
			//session.setAttribute("",""); session 값을 true로 주면 에러 안남.
		%>
	</body>
</html>