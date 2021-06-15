<!-- template.html -->
<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage== null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	
	/*
	cPage = 1   -> 0  , 10;
	cPage = 2   -> 10 , 10;
	cPage = 3   -> 20 , 10;
	start = 0, 10 20   , displayCount : 10
	An = a1 + (n-1)*d  
		-> a1 : 0 , n->cPage , d : displayCount		
	
	*/
	int displayCount = 4;
	int pageDispalyCount = 3;
	int totalRows = 0;//128
	int currentBlock = 0;
	int totalBlock = 0;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = 0 + (cPage-1)*displayCount;
	CustomerDao dao = CustomerDao.getInstance();
	ArrayList<CustomerDto> list = 
			dao.select(start, displayCount);
	
%>
  	<!-- breadcrumb start -->
  	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
	    <li class="breadcrumb-item">회원 리스트</li>
	  </ol>
	</nav>
	<!-- breadcrumb end -->
  	
  	<!-- container start -->
	<div class="container">
		<!-- col start -->
		<div class="row">
			<div class="col-md-12">
				<%-- table start --%>
				<h5>회원 리스트</h5>
				<div class="table-responsive">
				<table class="table table-hover">
				  <colgroup>
				  	<col width="10%">
				  	<col width="10%">
				  	<col width="65%">
				  	<col width="15%">
				  </colgroup>
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">이름</th>
				      <th scope="col">이메일</th>
				      <th scope="col">가입날짜</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  	if(list.size() != 0){
				  		for(CustomerDto dto : list){
				  %>
				    <tr>
				      <th scope="row"><%=dto.getNum() %></th>
				      <td></td>
				      <td><a href="view.jsp?num=<%=dto.getNum()%>&page=<%=cPage%>"></a></td>
				      <td><%=dto.getRegdate() %></td>
				    </tr>
				  <%	
				  		} 
				  	}else{
				  %> <tr>
				      <td colspan='4'>데이터가 존재 하지 않습니다.</td>
				    </tr>
				  <%} %>
				  </tbody>
				</table>
				<%--Pagination start --%>
	<%
		totalRows = dao.getRows();//128
		
		if(totalRows%displayCount==0){
			totalPage = totalRows/displayCount;
		}else{
			totalPage = totalRows/displayCount + 1;
		}
		if(totalPage == 0){
			totalPage = 1;
		}
		if(cPage%pageDispalyCount == 0){
			currentBlock = cPage/pageDispalyCount;
		}else {
			currentBlock = cPage/pageDispalyCount +1;
		}
			
		if(totalPage%pageDispalyCount == 0){
			totalBlock = totalPage/pageDispalyCount;
		}else {
			totalBlock = totalPage/pageDispalyCount +1;
		}
		startPage = 1 + (currentBlock -1)*pageDispalyCount;
		endPage = pageDispalyCount + (currentBlock -1)*pageDispalyCount;
		
		if(currentBlock == totalBlock){
			endPage = totalPage;
		}
	%>
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    
				    <li class="page-item disabled">
				      <a class="page-link" href="list.jsp?page=" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    
				    
				    <li class="page-item"><a class="page-link" href="list.jsp?page="></a></li>
				    
				    
				    <li class="page-item  disabled">
				      <a class="page-link" href="list.jsp?page=">Next</a>
				    </li>
				    
				  </ul>
				</nav>
				<%--Pagination end --%>
				<div class="text-right">
					<a class="btn btn-success" href="join.jsp?page=" role="button">회원가입</a>
				</div>
				</div>
				<%-- table end--%>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
<%@ include file="../inc/footer.jsp" %>