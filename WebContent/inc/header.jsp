<%@page import="kr.or.kpc.dto.CustomerDto"%>
<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="/js/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<title>template</title>
	<style>
		
	</style>
  </head>
  <body>
  
  	
  	
  	<!-- navbar start -->
  	<nav class="navbar navbar-expand-md navbar-dark" style="background-color : #7952b3">
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  	<%
	  		String path = request.getRequestURI();
	  	%>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item <%if(path != null && path.startsWith("/index.jsp")){ %>active<%}%>">
	        <a class="nav-link" href="/index.jsp">홈 <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item <%if(path != null && path.startsWith("/notice")){ %>active<%}%>">
	        <a class="nav-link" href="/notice/list.jsp">공지사항</a>
	      </li>
	      <li class="nav-item <%if(path != null && path.startsWith("/member")){ %>active<%}%>">
	        <a class="nav-link" href="/member/list.jsp">회원관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
	      </li>
	    </ul>
	    <span class="navbar-text">
	    	<%
	    		CustomerDto customerDto = 
	    			(CustomerDto)session.getAttribute("login");
	    		if(customerDto == null){
	    	%>
	      <a href="/member/login.jsp">로그인</a> | 
	      <a href="/member/join.jsp">회원가입</a>
	      <%}else{ %>
	      
	      <%=customerDto.getName() %>님 안녕하세요..[<span id="sessionTime"></span>]
	      <a href="/member/logtout.jsp">로그아웃</a> | 
	      <a href="/member/mypage.jsp">마이페이지</a>
	      <%} %>
	      
	    </span>
	  </div>
	</nav>
	<!-- navbar end -->
	<script>
		let time = <%=session.getMaxInactiveInterval()%>;
		let min = "";
		let sec = "";
		const x = setInterval(function(){
			min = parseInt(time/60);
			sec = time%60;
			$("#sessionTime").html(min+"분 "+sec+"초");
			time--;
			if(time <0){
				clearInterval(x);//실행끝
				location.href="/member/login.jsp";
			}
		},1000);
	</script>