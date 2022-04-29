<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${ pageContext.servletContext.contextPath }/resources/css/styles.css" rel="stylesheet" />
         <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
			//전송(submit)버튼이 눌러졌을 때, 입력값들에 대한 유효성 검사함
			function validate(){
				
				//validation 체크 검사 코드 구현함
				//서버 컨트롤러로 전송할 값들이 유효한 값인지 검사하는 것
				//암호와 암호확인이 같은 값인지 확인
				var pwdValue = document.getElementById("user_pwd").value;
				var pwdValue2 = document.getElementById("user_pwd2").value;
				var message = "";
				
				if(pwdValue !== pwdValue2){
					//alert("비밀번호와 비밀번호 확인의 값이 일치하지 않습니다.\n다시 입력하세요.");
					//document.getElementById("user_pwd").select();
					message += '<h5 style="color:red;" id="result_check">비밀번호가 일치하지 않습니다.</h5>'
					document.getElementById("result_check").innerHTML = message;
					
					return false;  //전송 취소
				}else{
					return true;
				}
			}
		</script>
		<style>
		.parent {
display: grid;
grid-template-columns: repeat(2, 1fr);
grid-template-rows: repeat(6, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
}

.div1 { grid-area: 1 / 1 / 2 / 2; }
.div2 { grid-area: 1 / 2 / 2 / 3; }
.div3 { grid-area: 2 / 1 / 3 / 2; }
.div4 { grid-area: 2 / 2 / 3 / 3; }
.div5 { grid-area: 3 / 1 / 4 / 2; }
.div6 { grid-area: 3 / 2 / 4 / 3; }
.div7 { grid-area: 4 / 1 / 5 / 2; }
.div8 { grid-area: 4 / 2 / 5 / 3; }
.div9 { grid-area: 5 / 1 / 6 / 2; }
.div10 { grid-area: 5 / 2 / 6 / 3; }
.div11 { grid-area: 6 / 1 / 7 / 2; }
.div12 { grid-area: 6 / 2 / 7 / 3; }
		</style>
    </head>
    <body>
		<c:import url="/WEB-INF/views/common/menubar.jsp" />
        <section class="page-section cta">
            <div class="container" >
                <div class="row" >
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                        	
                        	<!-- 태그 원하는 위치 삽입 참조 position(top,left,right,bottom)이용 ,이미지 사지즈는 반응형 웹 구조 때문에 px보다는 %선호-->
                        	
                           <br><br>
                            <h2 class="section-heading mb-5">
	                        	<span style="display:inline;" class="section-heading-lower">비밀번호 찾기</span>
                            </h2>
                            <form action="findPwd.do" method="post" onsubmit="return validate();">
            
<div class="parent" align="center" style="border: 4px solid maroon; border-radius: 4px; background-color: olive;width:500px; height: 500px; padding: 50px 50px 20px 50px; margin-left: 225px;">
<div class="div1"><div style=" width: 155px; border: 3px solid; border-radius: 4px; background-color:white; color:black; font-weight: 700;">*이름</div></div>
<div class="div2"><div><input id="user_name" name="user_name" placeholder="이름입력" required style="border-radius: 5px;"></div> </div>
<div class="div3"><div style=" width: 155px; border: 3px solid; border-radius: 4px; background-color:white; color:black; font-weight: 700;">*아이디</div></div>
<div class="div4"><div><input id="user_id" type="text" placeholder="아이디" name="user_id" required style="border-radius: 5px;"></div></div>
<div class="div5"><div style=" width: 155px; border: 3px solid; border-radius: 4px; background-color:white; color:black; font-weight: 700;">*새 비밀번호</div></div>
<div class="div6"><div><input id="user_pwd" type="password" placeholder="비밀번호 입력" name="user_pwd" required style="border-radius: 5px;"></div></div>
<div class="div7"><div style=" width: 155px; border: 3px solid; border-radius: 4px; background-color:white; color:black; font-weight: 700;">*비밀번호 확인</div></div>
<div class="div8"><div><input id="user_pwd2" type="password" placeholder="비밀번호 확인" required style="border-radius: 5px;"></div></div>
<div class="div9"><div style=" width: 155px; border: 3px solid; border-radius: 4px; background-color:white; color:black; font-weight: 700;">*생년월일</div></div>
<div class="div10"><div><input  id="user_birth" type="date" placeholder="yyyy-mm-dd (반드시 형식에 맞게 입력하세요)" name="user_birth" required style="border-radius: 5px; width: 190px;"></div>  <h5 id="result_check"></h5>  </div>


<div class="div11"><input class="btn btn-primary btn-block" type="submit" value="비밀번호 변경" onclick="javascript:location.href='';"> </div>
<div class="div12"><input class="btn btn-primary btn-block" type="button" onclick="javascript:history.go(-1); return false;" value="이전 페이지로"> </div>
</div>
</form>
   
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
</html>
