<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="commonview.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" /> -->

<style type="text/css">
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.th {
	border-bottom: 1px solid #444444;
	padding: 15px;
}

.td {
	border-bottom: 1px solid #444444;
	padding: 15px;
}
</style>

<title></title>


<script type="text/javascript">
	function showWrite() {
		location.href = "${ pageContext.servletContext.contextPath }/noticeWrite.do";
	}
</script>

<!-- 공지사항 -->
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		showDiv();

		$("input[name=item]").on("change", function() {
			showDiv();
		});
	});

	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) {
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(1).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(2).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
		<div class="container">
			<br>
			<br>
			<div
				style="background-color: #1a1a1a; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;"
				class="row">
				<form action="ninsert.do" method="post">
				<div class="col-xl-9 mx-auto">
					<br>
					<p style="color: white; font-size: 45px;" align="center">
						<b>공지사항 등록페이지</b>
					</p>
					<br>
					<div class="cta-inner bg-faded text-center rounded">
							<!-- =============================================================================== -->


							<table align="center" width="100%" cellspacing="0"
								cellpadding="10">
								<tr>
									<th style="color: white;">제 목</th>
									<td><input type="text" class="form-control"
										name="notice_title" required></td>&nbsp;
								</tr>
								<tr>
									<th style="color: white;">작 성 자</th>
									<td><input type="text" class="form-control" name="user_id"
										readonly value="${loginMember.user_id }"></td>&nbsp;
								</tr>
								<tr>
									<th style="color: white;">내 용</th>
									<td><textarea name="notice_content" class="form-control"
											rows="5" cols="50" required></textarea></td>&nbsp;
								</tr>
							</table>

							<!-- =============================================================================== -->
						</div>
						<br>
						<div align="right">
							<input style="background-color: white;"
								class="btn btn-primary btn-block" type="submit" value="등록하기">
							&nbsp; <input style="background-color: white;"
								class="btn btn-primary btn-block" type="reset" value="작성취소">
							&nbsp;
							<button style="background-color: white;"
								class="btn btn-primary btn-block"
								onclick="javascript:history.go(-1);return false;">목록</button>
							<!-- return false로 이벤트 전달 막음 -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
