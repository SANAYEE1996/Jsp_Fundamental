<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@page pageEncoding="utf-8"%>

<%
	//int cPage = Integer.parseInt(request.getParameter("page"));
	//int num = Integer.parseInt(request.getParameter("num"));
	
	String tempPage = request.getParameter("page");
	String tempNum = request.getParameter("num");
	int cPage = 0;
	int num = 0;
	if(tempPage == null || tempPage.length() == 0){
		cPage=1;
	}
	try{
	cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
	cPage = 1;
	}
	
	if(tempNum == null || tempNum.length()==0){
		num = -1;
	}
	try{
	num = Integer.parseInt(tempNum);
	}catch(NumberFormatException e){
	num = -1;
	}
	
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = dao.select(num);
	if(dto == null){
		num = -1;
	}
	if(num == -1){
%>
	<script>
	alert('삭제할 수 없는 글입니다.');
	location.href = "list.jsp?page=<%=cPage%>";
	</script>
<%
	}else{
	boolean success = dao.delete(num);
	if (success) {
	%>
	<script>
		alert('글이 삭제 되었습니다.');
		location.href = "list.jsp?page=<%=cPage%>";
	</script>
<%} else {%>
<script>
	alert('에러 발생');
	history.back(-1);
</script>

<%} %>
<%} %>

