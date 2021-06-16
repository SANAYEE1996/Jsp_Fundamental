<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>
<%
	if(customerDto == null){
		response.sendRedirect("/member/login.jsp");
		return;
	}
	CustomerDao dao = CustomerDao.getInstance();
	int num = customerDto.getNum();
	CustomerDto dto = dao.select(customerDto.getNum());
%>
  	<!-- breadcrumb start -->
  	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>
	    <li class="breadcrumb-item">마이페이지</li>
	 </ol>
	</nav>
	<!-- breadcrumb end -->
  	
  	<!-- container start -->
	<div class="container">
		<!-- col start -->
		<div class="row">
			<div class="col-md-12">
				<h3>마이페이지</h3>
	        	<form method="post" name="f" action="updateMypage.jsp">
				  <div class="form-group">
	                <input type="text" class="form-control" id="email" 
	                name="email"  readonly placeholder="Your Email *" value="<%=dto.getEmail() %>" />
	              	<div class="invalid-feedback" id="errorEmail">
				       이메일을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="password" class="form-control" id="newpwd" 
	                name="newpwd"  placeholder="Your New-Password *" value="" />
	              	<div class="invalid-feedback" id="errorNewPwd">
				    	새로운 비밀번호를 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <input type="text" class="form-control" id="name" 
	                name="name" placeholder="Your Name *" value="<%=dto.getName() %>" />
	              	<div class="invalid-feedback" id="errorName">
				       이름을 입력하세요.
				    </div>
				    <div class="valid-feedback">
				        Looks good!
				    </div>
	              </div>
	              <div class="form-group">
	                <select class="form-control" 
	                	id="status" name="status">
				      <option value="1" 
				   <%if(dto.getStatus().equals("1")){ %>selected<%} %>>가입</option>
				      <option value="2" 
				   <%if(dto.getStatus().equals("2")){ %>selected<%} %>>탈퇴</option>
				    </select>
	              </div>
	              <input type="hidden" name="num" value="<%=dto.getNum()%>">
	              
				</form>
				<div class="text-right" style="margin-bottom : 20px;">
					<a href="" id="updateCustomer" 
								class="btn btn-outline-success">회원수정</a>
				</div>
			</div>
		</div>
		<!-- col end -->
	</div>
	<!-- container end -->
	<script>
	$(function(){
		$('#updateCustomer').click(function(e){
			e.preventDefault();
			f.submit();
		});
	});	
	</script>
<%@ include file="../inc/footer.jsp" %>