<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title></title>

<style>

.tb1{ 
	cellspacing:0; 
	background-color: #e6e6e6; 
	color: black; 
	width: 100%;
	border: 3px solid white;
	border-spacing: 10px;
	border-collapse: collapse;
	margin-top: 0px;
}

#toptr{

	background-color: #e6e6e6; 
	border: 1px solid #e6e6e6;
	height: 40px;
	
}
#bottomtr{
	border: 1px solid black;
	background-color: white; 
}


td{
	font-size: 20px;
	padding: 5px 5px 0px 5px;
	height: 30px;
	margin-bottom: 0px; 
	
}


#loginbox{
	margin: 13px 5px 10px 5px;padding: 0px;
	position:static; 
}
#box1{
	margin:auto; width: 90px; height: 40px; font-size: 15px; background-color: gray; border-radius: 5px; padding-top: 8px;
}


#inputID{  /*로그인 창 인풋*/

	margin: 5px;
	width: 150px;

}
#inputPassword{  /*로그인 창 인풋*/

	margin: 5px;
	width: 150px;

}

/*   로그인창 버튼  */
#btn{  /* 아이디 찾기 버튼*/
	margin: 0;
	padding: 0;
	border-radius: 9px;
	font-size: 13px;
	width: 100px;
	height: 30px;
}
#btn1{  /* 비밀번호 찾기 버튼*/
	
	float: left;
	margin: 0;
	padding: 0;
	border-radius: 9px;
	font-size: 13px;
	width: 100px;
	height: 30px;
}
#btn2{  /* 회원가입 버튼*/
	margin: 0 0 0 -20px;
	padding 0;
	border-radius: 9px;
	font-size: 13px;
	width: 100px;
	height: 30px;
}

/*   로그인창 버튼  end */


/* 로그인창 그리드  */
.parent {
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-template-rows: repeat(5, 1fr);
grid-column-gap: 3px;
grid-row-gap: 7px;
}

.div1 { grid-area: 1 / 1 / 2 / 2; }  /* 박스(로그인) */
.div2 { grid-area: 1 / 2 / 2 / 3; }/*  아이디 입력창*/
.div3 { grid-area: 1 / 3 / 3 / 4; }/* 로그인버튼 */
.div4 { grid-area: 2 / 1 / 3 / 2; }/* 박스(비밀번호)  */
.div5 { grid-area: 2 / 2 / 3 / 3; } /* 비밀번호입력창  */
.div6 { grid-area: 3 / 1 / 4 / 2; } /* 아이디찾기  */
.div7 { grid-area: 3 / 2 / 4 / 3; }/* 비밀번호찾기  */
.div8 { grid-area: 3 / 3 / 4 / 4; }


/* 메인 그리드 */
.mainA {
display: grid;
grid-template-columns: repeat(3, 1fr);
grid-template-rows: repeat(3, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
}
.main1 { grid-area: 1 / 1 / 2 / 4; height: 500px;} /* 지도  */
.main2 { grid-area: 2 / 1 / 3 / 2; height: 500px;} /* 레시피  */
.main3 { grid-area: 2 / 2 / 3 / 3; height: 500px;} /* 운동법  */
.main4 { grid-area: 2 / 3 / 3 / 4; height: 500px;} /* 로그인  */
.main5 { grid-area: 3 / 1 / 4 / 2; height: 500px;} /* 공지 */
.main6 { grid-area: 3 / 2 / 4 / 3; height: 500px;} /* 게시판  */




/*  박스  */
.square {
  width: 500px;
  height: 500px;
  background: black;
  border-radius: 30px;
}


/*   겉 테두리  */
#se{
	position: relative;
	margin: auto;
	width: 100%;
	max-width: 1350px;
	height: 100%;
 	background: white;
 	border-radius: 30px;
 	border: 3px solid black;
 	flex-wrap: wrap; 
 	transition: all ease-in-out 0.3s;
  }	
  	


#mdv2{  /* 레시피, 운동법*/
	border: 2px solid black;
	border-radius: 20px; 
	padding: 0px; 
	margin: 250px 30px 0px 25px; 
	text-align: center; 
	width: 400px; 
	height: 330px; 
	background-color: black; 
	color: white;
	position:relative;
}

#mdv{ /* 공지, 게시판*/
	border: 2px solid black;
	border-radius: 20px; 
	padding: 0px; 
	margin: 350px 30px 0px 25px; 
	text-align: center; 
	width: 400px; 
	height: 330px; 
	background-color: black; 
	color: white;
	top : -200px;
	position:relative;
}

#logindiv{ /*로그인박스*/
	border: 2px solid black;
	border-radius: 20px; 
	padding: 13px; 
	margin: 250px 30px 0px 25px; 
	text-align: center; 
	width: 390px; 
	height: 200px; 
	background-color: black; 
	color: white;
	position:relative;
}
#spotdiv{  /* 스팟( 지도) */
	border: 2px solid black;
	border-radius: 20px; 
	padding: 0px; 
	margin: 10px 30px 30px 25px;   /* 상 우 하 좌 */
	text-align: center; 
	width: 1300px; 
	height: 700px; 
	background-color: black; 
	color: white; 
	 


}
</style>

<script type="text/javascript" 
src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	/* 주기적으로 자동 실행되게 하려면 자바스크립트 내장함수 setInterval(실행시킬함수명, 시간간격밀리초) 사용하면 됨*/
	/* setInterval(function(){
		console.log("setInterval() 에 의해 자동 실행 확인.");
	}, 100); */
	
	//최근 등록한 공지글 3개 출력되게 함
	
	
	//조회수 많은 인기 게시 원글 상위 3개 조회 출력되게 함
	$.ajax({
		url: "btop5.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data); //Object 로 받아짐
			
			//object => string 으로 바꿈
			var jsonStr = JSON.stringify(data);
			//string => json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			 
			var values = "";
			for(var i in json.list){  //i(인덱스) 변수가 자동으로 1씩 증가 처리됨
				values += "<tr id='bottomtr'><td>" + json.list[i].board_no 
						+ "</td><td><a style='text-decoration:none; color: black;' href='bdetail.do?board_no=" + json.list[i].board_no + "'>"
						+ decodeURIComponent(json.list[i].board_title).replace(/\+/gi, " ") 
						+ "</a></td><td>" + json.list[i].board_count + "</td></tr>";
			}  //for in
			
			$("#toplist").html($("#toplist").html() + values);
		},
		error: function(jqXHR, textstatus, errorthrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
		}
	});  //ajax
});  //document.ready

function movePage(){
	location.href = "login.do";
}
</script>


</head>
<body>

<div style=" position: width: 70%; min-width: 100%; margin-right:auto; margin-left:auto; ">
 <div  id="se">
<nav>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
</nav>
<br>
<br>

<div class="mainA">
<div class="main1"> 
<div id="spotdiv">
			<h4><br>다이어트 스팟</h4>
	 
			<c:import url="/WEB-INF/views/common/kakaomap.jsp" />
		
		</div>
</div>
<div class="main2"> 
<div id="mdv2" >
		<h4><br>추천 레시피</h4><br>
		<table id="#"  class="tb1" >
			<tr id="toptr">
				<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>


</div>
<div class="main3"> 
<div id="mdv2" >
		<h4><br>운동법</h4><br>
		<table id=""  class="tb1" >
			<tr id="toptr">
					<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>
</div>

<div class="main4">
<!-- 비로그인한 경우 -->
    	<c:if test="${ empty loginMember }">
	   <div id="logindiv">
		<form action="login.do" method="post">
		<div class="parent" id="loginbox">
			<div class="div1">
					<div id="box1" for="inputID">
						아이디 
					</div>
				</div>
			<div class="div2"><input id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }" required/></div>
			<div class="div3" ><button onclick="movePage()" class="btn btn-outline-secondary"  type="submit"  style="float:left; height: 100px; border-radius: 8px;">로그인</button></div>
			<div class="div4">
					<div id="box1" for="inputPassword">
						비밀번호 
					</div>
					</div>
			<div class="div5"><input id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }" required/></div>
			<div class="div6"><button type="button" id="btn" onclick="javascript:location.href='findIdPage.do';">아이디 찾기</button></div>
			<div class="div7"><button onclick="javascript:location.href='findPwdPage.do';" type="button" id="btn1">비밀번호 찾기</button></div>
			<div class="div8"><button onclick="javascript:location.href='registerPage.do';" type="button" id="btn2">회원가입</button></div>
		</div>
		</form>	
		</div> 
	    </c:if>

<!-- 로그인한 경우 : 일반회원인 경우 -->
		<c:if test="${ !empty loginMember and loginMember.admin_ok ne 'Y' }">
		 <div id="logindiv"> 
			<div >
				<div align="left" style="font: 40px oblique bolder;">Food Balance</div>
				<div align="right" style="font: 30px bold; margin-top: 20px; color:white;">${ sessionScope.loginMember.user_name }&ensp;&ensp;님</div><br>
				<c:url var="callMyInfo2" value="myinfo.do">
					<c:param name="user_id" value="${ loginMember.user_id }" />
				</c:url>
				<button style="border-radius: 4px; width: 100px; height: 35px; left: 60px;  margin-right: 50px;" onclick="javascript:location.href='${ callMyInfo2 }';">My Page</button>
				<button style="border-radius: 4px; width: 100px; height: 35px; left: 60px;  margin-right: 0px;" onclick="javascript:location.href='logout.do';">로그아웃</button>
			</div>
			</div>
		</c:if>
		<!-- 로그인한 경우 : 관리자인 경우 -->
		<c:if test="${ !empty loginMember and loginMember.admin_ok eq 'Y' }"> 
			<div id="logindiv">
			<div >
				<div align="left" style="font: 40px oblique bolder;">Food Balance</div>
				<div align="right" style="font: 30px bold; margin-top: 20px; color:white;">관리자(${ sessionScope.loginMember.user_name })님</div>
				<c:url var="callMyInfo" value="myinfo.do">
					<c:param name="user_id" value="${ loginMember.user_id }" />
				</c:url>
				<button style="border-radius: 4px; width: 100px; height: 35px; left: 60px;  margin-right: 50px;" onclick="javascript:location.href='${ callMyInfo }';">My Page</button>
				<button style="border-radius: 4px; width: 100px; height: 35px; left: 60px;  margin-right: 0px;" onclick="javascript:location.href='logout.do';">로그아웃</button>
			</div>
			
			</div>
		</c:if>

</div>
<div class="main5">
<div id="mdv" >
		<h4><br>공지사항</h4><br>
		<table class="tb1" id="newnotice">
			<tr id="toptr">
				<th style="width: 80px">No.</th>
				<th style="width: 300px">Name</th>
				<th style="width: 90px">Value</th>
			</tr>
		</table>
	</div>
</div>

<div class="main6">
<div id="mdv" >
		<h4><br>게시판</h4><br>
		<table id="toplist" class="tb1"  >
			<tr id="toptr">
				<th style="width: 80px">No.</th>
				<th style="width: 400px">Name</th>
				<th style="width: 80px">Value</th>
			</tr>
		</table>
	</div>
</div>

</div>
   


<footer style="">
				<c:import url="/WEB-INF/views/common/footer.jsp" />
</footer>
</div>   
  </div>


</body>
</html>