<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<title>FoodBalance</title>
<style type="text/css">
	li{
	   list-style:none;
	   padding-left:0px;
	}
	section{
		width : 100%;
		height: 1000px;
	}
	.div-warp{
		position: absolute;
		top : 50%;
		left : 50%;
		transform: translate(-50%, -20%);
	}
	.div1{
		background-color: yellow;
		width : 400px;
		height: 900px;
	}
	.div2{
		padding : 10px 15px 10px 0;
	}
</style>





<!-- 주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function findAdd(){
		   new daum.Postcode({
		       oncomplete: function(data) {
		           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var addr = ''; // 주소 변수
	               var extraAddr = ''; // 참고항목 변수

	               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                   addr = data.roadAddress;
	               } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                   addr = data.jibunAddress;
	               }
	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               document.getElementById("postcode").value = data.zonecode;
	               document.getElementById("address1").value = addr;
	               // 커서를 상세주소 필드로 이동한다.
	               document.getElementById("address2").focus();
	           }
		        
		   }).open();
	}
</script>		

<!-- 회원가입 -->
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
			var check = document.getElementById("check2").value;
			var message = "";
				
			if(pwdValue !== pwdValue2){
				//alert("비밀번호와 비밀번호 확인의 값이 일치하지 않습니다.\n다시 입력하세요.");
				//document.getElementById("user_pwd").select();
				message += '<h5 style="color:red;" id="result_check">비밀번호가 일치하지 않습니다.</h5>'
				document.getElementById("result_check").innerHTML = message;
					
				return false;  //전송 취소
			}else{
				//중복체크 했는지 물음
				if(check == "ok"){
					return true;  //전송함
				}else{
					message += '<h5 style="color:red;" id="result_check">아이디 중복체크 해주십시오.</h5>'
					document.getElementById("result_check").innerHTML = message;
					return false;  //전송 취소
				}
			}
		}
			
		//아이디 중복 체크 확인을 위한 ajax 실행 처리용 함수
		//ajax(Asynchronous Javascript And Xml) :페이지를 새로고침하지 않고, 현재 페이지에서 서버와 통신함
		//현재 페이지 안에서 일부분으로 서버와 통신하고 결과 출력하는 구조임
		//웹페이지에서 서버로 서비스를 요청하면, 서버는 요청을 받아서 처리하고, 처리결과로 웹페이지를 내보냄
		//클라이언트 브라우저에서는 요청결과에 대해 페이지가 항상 새로고침됨
		function dupCheckId(){
				
			var result = "";
			var message = "";
				
			$.ajax({
				url: "idchk.do",
				type: "post",
				data: { user_id: $("#user_id").val() },
				success: function(data){
					console.log("success : " + data);
					if(data == "ok"){
						//alert("사용 가능한 아이디 입니다.");
						message += '<h5 align="left" style="color:red;" id="idcheck">사용 가능한 아이디 입니다.</h5>'
						result += '<input id="check2" type="hidden" value="ok">'
							
						document.getElementById("idcheck").innerHTML = message;
						document.getElementById("check1").innerHTML = result;
							
						$("#user_pwd").focus();

					}else{
						//alert("이미 사용중인 아이디 입니다.\n다시 입력하세요.");
							
						message += '<h5 align="left" style="color:red;" id="idcheck">이미 사용중인 아이디 입니다.</h5>'
						result += '<input id="check2" type="hidden" value="no">'
							
						document.getElementById("idcheck").innerHTML = message;
						document.getElementById("check1").innerHTML = result;
						$("#user_id").select();
					}
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown)
				}
			});
				
		}
</script>
</head>
<body>
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
 	<section>
            <div class="div-warp">
            	<div class="div1">
	            	<div class="div2"> 
		                <h2>
			            	<span style="display:inline;" class="section-heading-lower">회원가입</span>
			                 <h5 align="center">(* 표시는 필수입력 항목입니다.)</h5>
		                </h2>		                            
		                <ul>    
		                    <form action="enroll.do" method="post" onsubmit="return validate();">
		                    	<h5>*아이디</h5>
			                     <li>
					                <div>
					                	<input id="user_id" type="text" placeholder="아이디" name="user_id" required/>
					                    <input style="display:inline" type="button" value="중복체크" onclick="return dupCheckId();">                       	
					                </div>
					                <h5 align="left" id="idcheck"></h5>
			                     </li>
			                                
			                     <h5>*비밀번호</h5>
			                     <li>
			                     	<div>
			                        	<input class="form-control" id="user_pwd" type="password" placeholder="비밀번호 입력" name="user_pwd" required/>
			                        </div>
			                     </li>
			                                
			                     <h5>*비밀번호 확인</h5>
			                     <li>
			                     	<div>
					                	<input class="form-control" id="user_pwd2" type="password" placeholder="비밀번호 확인" required>
					                </div>
			                     </li>
			                                
			                     <h5>*이름</h5>
			                     <li>
			                     	<div>
					                	<input class="form-control" id="user_name" placeholder="이름 입력" name="user_name" required>
					                </div>
			                     </li>
			                                
			                     <h5>*생년월일</h5>
			                     <li>
			                     	<div>
					                 	<input type="date" class="form-control" id="user_birth" placeholder="yyyy-mm-dd (반드시 형식에 맞게 입력하세요)" name="user_fnum" required>
					                </div>
			                     </li>
			                                
			                     <h5>주민번호 뒤 첫째자리</h5>
			                     <li>
			                     	<div>
					                	<input class="form-control" placeholder="1,2,3,4" name="user_enum" required>
					                </div>
			                     </li>
			                     
			                     <h5>*Email</h5>
			                     <li>
			                     	<div>
					                	<input class="form-control" id="email" placeholder="이메일 형식에 맞게 입력하세요." name="email" required>
					                </div>
			                     </li>           
			                     <h5>*휴대폰 번호</h5>
			                     <li>
			                     	<div>
					                	<input class="form-control" id="phone" placeholder="휴대폰 번호 입력(-제외한 숫자만 입력)" name="phone" required>
					                </div>
			                     </li>
			                                
			                     <h5>*주소</h5>
			                     <li>
			                     	<div>
			                     		<button style="display:inline" onclick="findAdd();">주소 찾기</button>
					                	<input class="form-control" style="display:inline;" id="postcode" name="postcode" placeholder="우편번호" required readonly/>
					                </div>
					                <div>
					                	<input class="form-control" id="address1" placeholder="주소 입력" name="address1" required readonly>
					                </div>
					                <div>
					                	<input class="form-control" id="address2" placeholder="상세 주소 입력" name="address2" required>
					                </div>
			                     </li>
			                                
			                     <h5>*키워드</h5>
			                     <li>
			                     	<div>
					                	<input class="form-control" id="keyword" placeholder="비밀번호 찾기 키워드" name="keyword" required>
					                </div>
			                     </li>
			                                
			                     <div id="check1">
			                     	<input id="check2" type="hidden" value="no">
			                     </div>
			                                
			                     <h5 id="result_check"></h5>
			                                
			                     <div>
			                      	<input type="submit" value="가입하기">
			                        <input type="reset" value="작성취소">
					             </div>
				             </form>
		                </ul>
	                </div>
                </div> 
            </div>
	</section>




<c:import url="/WEB-INF/views/common/footer.jsp" />


</body>
</html>