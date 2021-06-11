<!-- step01_grid_lg.html -->
<%@page pageEncoding="utf-8" %>
<%@include file="../inc/header.jsp" %>
  <!-- breadcrumb start -->
  <!-- breadcrumb end -->
  <!-- container start -->
    <div class="container">
    	
  <!-- col start -->
 	<div class="row">
    	<div class="col-md-12">
    	
    		<%--slide start --%>
    	
    			
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height :550px; width : 900px; margin : 0 auto;">
					<h1>Hello!</h1>
				  <ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				  </ol>
				  <div class="carousel-inner" style="height :500px; width : 900px">
				    <div class="carousel-item active">
				      <img src= "https://i.ibb.co/zRxYTQN/image.jpg" class="d-block w-100"  >
				    </div>
				    <div class="carousel-item"style="height :500px; width : 900px; margin : 0 auto;">
				      <img src="https://images.wsj.net/im-335891?width=1260&size=custom_1280x853" class="d-block w-100" >
				    </div>
				    <div class="carousel-item"style="height :500px; width : 900px">
				      <img src="https://i.ibb.co/LC3Ymkf/1.jpg" class="d-block w-100">
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
				</div>
    	
    		<%--slide end --%>
			<div class="text-center" style="margin:20px 0 0 0">
			<a class="btn btn-secondary" href="park.jsp" role="button">Let's START</a>
			</div>
    	</div>
    </div>
  <!-- col end -->
    </div>
  <!-- container end -->
<%@include file="../inc/footer.jsp" %>
  