<!-- template.html -->
<%@ page pageEncoding="utf-8" %>
<%@ include file="header.jsp" %>
     <!-- breadcrumb start -->
     <nav aria-label="breadcrumb">
    <ol class="breadcrumb" style="background-color: green">
    <li class="breadcrumb-item"><a href="q.jsp" style="color:white">Back </a></li>
     </ol>
   </nav>
   <!-- breadcrumb end -->
     
     <!-- container start -->
   <div class="container">
      <!-- col start -->
      <div class="row">
            <h1></h1>
         </div>
      </div>
      <!-- col end -->
      <link rel="preconnect" href="https://fonts.gstatic.com">
   
   <!-- container end -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<style>
.text{
text-align:center;
font-family: 'Gaegu', cursive;
top: 55%;
font-size : 53px;
}
#carouselExampleIndicators{
 margin: 0;
  position: absolute;
  border-radius: 12px;
 top: 55%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.button {
  margin: 0;
  position: absolute;
  border-radius: 12px;
  top: 110%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
font-family: 'Gaegu', cursive;
  background-color: white;
color:green;
  font-size:40px;
  href="/notice/main.jsp";
  width:400px;

}
.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}
.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.button:hover{
background-color:green; 
color: white; 
 box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;

</style>   
   
   <%--slide start --%>
       
             <p class="text">당신은 어떤 공원을 찾고 있나요?</p>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

              <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              </ol>
              <div class="carousel-inner" style="height :500px; width : 900px">
                <div class="carousel-item active">
                  <img src= "https://yeyak.seoul.go.kr/web/common/file/FileDown.do?file_id=SVC_IMG_FILE_276043" class="d-block w-100"  >
                </div>
                <div class="carousel-item"style="height :500px; width : 900px">
                  <img src="https://www.gyeongju.go.kr/upload/content/thumb/20191221/AE6D7E99E242454D9B60B82E9C7313A5.jpg" class="d-block w-100" >
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
                          <div class="button" >
   <a href="park.jsp" class="button">
   <button class="button" style="vertical-align:middle" ><span>우리가 찾아줄게요!</span></button>
   </a>
   </div>
</div>

       
          <%--slide end --%>

   