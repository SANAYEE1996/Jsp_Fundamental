<%-- script jsp--%>
<%@ page pageEncoding = "utf-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "utf-8">
		<title> scripting element</title>
	</head>
	<body>
		<h1> 스크립팅 엘리먼트 </h1>
		<%!
			private int age;
			public int getAge(){
				return age;
			}
			public void getAge(int age){
				this.age = age;
			}
		%>
		<%
			int a = 10;
		%>
		<!-- 자바 변수를 출력할 목적 -->
		<%=a %>
		
		<!-- 반복문 코드 -->
		<ul>
		<%
			for(int i=0; i<10; i++){
				out.print("<li>" +i+"</li>");	
			}
		%>
		</ul>
		
		<!-- 더 직관적인 반복문 코드 -->
		<ul>
		<%
			for(int i = 0; i < 10; i++){ %>
				<li> <%=i %></li>	
			<%} 
		%>
		</ul>
	</body>
</html>