<%@ page pageEncoding = "utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jquery event</title>
    <script src="./js/jquery-3.6.0.js"></script>
    <script>
        $(function(){
            $('#id').focus();
            
            //$('#sendMember').click(function(event)
            //$('#sendMember').bind("click",(function(event){
            $('#sendMember').on("click",(function(event){
                //원래의 기능을 못쓰게 한다.
                //submit 버튼의 기능 : action으로 페이지를 이동.
                event.preventDefault();
                alert('send button');

                //유효성 체크
                let id = $("#id").val();    //id 입력했던 값이 나옴.
                let email = $("#email").val();
                let pwd = $("#pwd").val();

                if(id==""){ //if(id=="")
                    $('#errorId').css("display","block");
                    //$('#id').focus();
                    //return;
                }else{
                    $('#errorId').css("display","none");
                }
                if(email==""){ //if(email=="")
                    $('#errorEmail').css("display","block");
                    //$('#email').focus();
                    //return;
                }else{
                    $('#errorEmail').css("display","none");
                }
                if(pwd==""){ //if(pwd=="")
                    $('#errorPwd').css("display","block");
                    //$('#pwd').focus();
                    //return;
                }else{
                    $('#errorPwd').css("display","none");
                }

                if(id==""){ 
                    $('#id').focus();
                    return;
                }
                if(email==""){ 
                    $('#email').focus();
                    return;
                }
                if(pwd==""){ 
                    $('#pwd').focus();
                    return;
                }

                //document.memberForm.submit();
                document.memberForm.action="/hello";
                document.memberForm.submit();
            }));
        });
    </script>
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body>
    <h3>jquery event</h3>
    <form name = 'memberForm' method='post' action = 'save.html'>
    	<div>
    		<%
    			for(int i = 2; i<=9; i++){
    				for(int j = 1; j <=9 ; j++){
    					out.print(i+" * "+j+" = "+i*j+"    ");
    					if(j%3 == 0) out.print("<br>");
    				}
    				out.println("<br>");
    			}
    		%>
    	</div>
        <div>
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" 
            placeholder="아이디를 입력하세요">
            <span class = "error" id = "errorId"
                style="display:none">아이디를 입력하세요</span>
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" 
            placeholder="이메일를 입력하세요">
            <span class = "error" id = "errorEmail"
                style="display:none">이메일을 입력하세요</span>
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" 
            placeholder="비밀번호를 입력하세요">
            <span class = "error" id = "errorPwd"
                style="display:none">비밀번호를 입력하세요</span>
        </div>
        <div>
            <button type = "submit" id = "sendMember">회원가입</button>
            <button type = "reset">취소</button>
        </div>
    </form>
</body>
</html>