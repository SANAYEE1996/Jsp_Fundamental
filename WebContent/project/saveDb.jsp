<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@page pageEncoding="utf-8"%>

<%
request.setCharacterEncoding("utf-8");
String writer = request.getParameter("writer");
String title = request.getParameter("title");
String content = request.getParameter("content");
NoticeDao dao = NoticeDao.getInstance();
int num = dao.getMaxNum();
NoticeDto dto = new NoticeDto(num, writer, title, content, null);
boolean success = dao.insert(dto);
if (success) {
%>
<script>
	alert('글이 추가 되었습니다.');
	location.href = "list.jsp?page=1";
</script>
<%
} else {
%>
<script>
	alert('에러 발생');
	history.back(-1);
</script>


<%
}
%>
