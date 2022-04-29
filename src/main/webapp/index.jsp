<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="0;url=https://127.0.0.1:8888/food">
<script>
var url_1 = window.location;
var url_2 = "http://127.0.0.1:8888"

if(url_1 == url_2) window.location = "https://127.0.0.1:8888/food";;
</script>
<title></title>
</head>
<body>
<jsp:forward page="main.do"/>
</body>
</html>