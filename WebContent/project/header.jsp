<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Park Map</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="/js/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<script>
        
        $(function(){
            $('#btn').click(function(){
               $.ajax({
                   url : 'proxy.jsp?url=http://openapi.seoul.go.kr:8088/715142614f7170613131326449687761/json/RealtimeCityAir/1/25',
                   type : 'get',
                   dataType : 'json',
                   error : function(){},
                   success : function(json){
                	   let rowArray = json.RealtimeCityAir.row;
                	   let MSRSTE_NM;
                	   let PM10;
                	   let PM25;
                	   let IDEX_NM;
                	   for(const row of rowArray){
                		   MSRSTE_NM = row.MSRSTE_NM;
                		   PM10 = row.PM10;
                		   PM25 = row.PM25;
                		   IDEX_NM = row.IDEX_NM;
                		   if($("#dist option:selected").text() == MSRSTE_NM){
               		   			$('#sel').append(" 미세먼지 농도 :  "+PM10+" 초미세먼지 농도 : "
               		   						+PM25+" 대기 상태 : "+IDEX_NM);
               		   			break;
               		   		}
                	   }
                	   if(IDEX_NM == "좋음"){
                		   $('#sel2').append("쾌적합니다. 마음껏 외출하셔도 괜찮은데 마스크! 잊지마세요~");
                	   }
                	   else	if(IDEX_NM == "보통"){
                		   $('#sel2').append("대기질은 양호하나, 일부 대기오염 민감군에 영향을 줄 수 있습니다.");
						}
                	   else if(IDEX_NM == "나쁨"){
                		   $('#sel2').append("건강한 일반인에서 대기오염으로 인한 경미한 반응이 나타나며, <br>민감군에 미치는 영향은 좀 더 클 수 있습니다.");
                	   }
                	   else if(IDEX_NM == "매우 나쁨"){
                		   $('#sel2').append("건강한 일반인에서 대기오염으로 인한 경미한 반응이 나타나며, <br>민감군에 미치는 영향은 좀 더 클 수 있습니다.");
                	   }
                	   else if(IDEX_NM == "위험"){
                		   $('#sel2').append("건강한 일반인에서 대기오염으로 인한 건강상의 심각한 반응이 나타날 수 있습니다.");
                	   }
                   }
         	 });
		});
     });
</script>
<script src = "http://openapi.seoul.go.kr:8088/715142614f7170613131326449687761/json/RealtimeCityAir/1/25?call=test"></script>
 <style>
	.Nav {
     max-width: 980px;
     margin: 0 auto;
     overflow: visible
   }
   .wrapper {
     height: 5vh;
   }
   
   body {
     margin: 0;
   }
   
   nav {
     height: 44px;
    
     rgba:(0,0,0,0.5)
   }
   
   nav ul {
     display: flex;
     height: 44px;
     justify-content: space-around;
     align-items: center;
     padding: 0;
     margin: 0 auto;
     list-style-type: none;
   }
   
   nav li {}
   
   nav a {
     display: block;
     color:green;
     font-size: 20px;
     font-family:fantasy;
     font-weight: lighter;
     text-decoration: none;
     transition: 0.3s;
   }
   
   nav a:hover {
     color: #B8B8B8;
   }
   
   .appleNav {
     max-width: 980px;
     margin: 0 auto;
   }
   .breadcrumb-item{
   color: white;
   font-family:fantasy;
   font-size: 20px;
   }
   
   
   .text{
   position: relative;
   text-align:left;
   font-family: 'Gaegu', cursive;
   top: 3%;
   font-size : 53px;
   }
   
	#btn{
	    margin: 0;
	    position: absolute;
	    border-radius: 12px;
	    top:68% ;
	    left: 43%;
	   	font-family: 'Gaegu', cursive;
	    background-color: white;
	   	color:green;
	    font-size:20px;
	    width:70px;
	   }
   
   #btn:hover{
	background-color:green; 
	color: white; 
	 box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
	}
	
	h3{
   		font-family: 'Gaegu', cursive;
   }

   #address{
   		position:relative;
   }
</style>
  </head>
<body>
<div class="wrapper">
  <nav>
    <div class="Nav">
      <ul>
        <li><a href="program.jsp">HOME</a></li>
        <li><a href="park.jsp">PARK</a></li>
         <li><a href="list.jsp">SUGGESTION</a></li>
        <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         EXERCISE
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="upper.jsp">상체운동</a>
	          <a class="dropdown-item" href="down.jsp">하체운동</a>
	          <div class="dropdown-divider"></div>
      		</div>
		<!-- navbar end -->    
      </ul>
    </div>
  </nav>
</div>
  	<!-- navbar end -->