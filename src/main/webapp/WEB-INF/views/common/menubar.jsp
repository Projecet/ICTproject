<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

<style type="text/css">
  #menubtn{
 	 background-color: #52575c;
 	 font-size: 20px;
 	 text-align: center;
 	 
  }
  #menubtn:hover{
   
  	background-color: silver;
  	}
</style>
<title></title>
</head>

<br>

<h1 style="float: left; font-size: 40px; ">FOOD BALANCE</h1>
<c:import url="/WEB-INF/views/common/loginSession.jsp" />

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02" >
      <ul class="navbar-nav me-auto" style="margin: auto;">
 
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='main.do';">홈
            <span class="visually-hidden">(current)</span>
        
         </button>
      &ensp;&ensp;&ensp;
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='#';">음식이미지 ai분석
      
            </button>
         &ensp;&ensp;&ensp;
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='#';">공지사항</button>
    &ensp;&ensp;&ensp;
       
          <button type="button" class="btn btn-outline-secondary" id="menubtn" onclick="javascript:location.href='blist.do';">게시판</button>
         &ensp;&ensp;&ensp;
       <button type="button" class="btn btn-outline-secondary" id="menubtn">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">다이어트 추천</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">추천레시피</a>
              <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#" >운동법</a>
          </div>
        </li>
        </button>
     
      </ul>
 
    </div>
  </div>
</nav>
</body>
</html>

