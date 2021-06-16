<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
	<title>Park Recommendation</title>
	<style>
		 body {
        margin: 0;
      }
      .container {
        width: 100vw;
        height: 100vh;
        background: url('https://wallpaperaccess.com/full/1826325.jpg');
      }
	 .title {
	  margin: 0;
	  position: absolute;
	  top: 46%;
	  left: 46%;
	   -ms-transform: translate(-50%, -50%);
	  transform: translate(-50%, -50%);
	  }
		.button {
		  margin: 0;
		  position: absolute;
		  border-radius: 12px;
		  top: 52%;
		  left: 63%;
		  -ms-transform: translate(-50%, -50%);
		  transform: translate(-50%, -50%);
		  font-family:fantasy; 
		  background-color: white;
		color:green;
		  font-size:60px;
		  href="/notice/main.jsp";
		  width:250px;
		
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
</head>
<body>
<div class="container">
	<div class="title">
   		<h1 style="font-family:fantasy; color:white; font-size:75px;">Are you looking for a NEARBY PARK?</h1></div>
		<div class="button" >
   			<a href="program.jsp" class="button">
   				<button class="button" style="vertical-align:middle" ><span>Go!</span></button>
   			</a>
		</div>
  	</div>
</body>
</html>
  
  
 
