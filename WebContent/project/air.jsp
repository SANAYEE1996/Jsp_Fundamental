<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>your air weather!</title>
    <script src="../js/jquery-3.6.0.js"></script>
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
                	   for(const row of rowArray){
                		   let MSRSTE_NM = row.MSRSTE_NM;
                		   let PM10 = row.PM10;
                		   let PM25 = row.PM25;
                		   let IDEX_NM = row.IDEX_NM;
                		   $('#sel').append(MSRSTE_NM+" 미세먼지 농도 :  "+PM10+" 초미세먼지 농도 : "+PM25+" 대기 상태 : "+IDEX_NM+"<br>");
                	   }
                   }
               });
            });
        });
    </script>
    <script src = "http://openapi.seoul.go.kr:8088/715142614f7170613131326449687761/json/RealtimeCityAir/1/25?call=test"></script>
</head>
<body>
	<button id="btn">가져오기</button>
	<div id = "sel">

    </div>
</body>
</html>