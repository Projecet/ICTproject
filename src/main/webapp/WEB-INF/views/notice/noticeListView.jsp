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
		location.href = "${ pageContext.servletContext.contextPath }/bwform.do";
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
				<div class="col-xl-9 mx-auto">
					<br>
					<p style="color: white; font-size: 45px;" align="center">
						<b>공지사항</b>
					</p>
					<br>
					<div class="cta-inner bg-faded text-center rounded">
						<!-- =============================================================================== -->
						<%
							int num = 1;
						%>
						<table
							style="border-top: 1px solid #444444; border-collapse: collapse; width: 98%; background: white; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px; text-align: center;"
							align="center" cellspacing="0" cellpadding="15">
							<tr>
								<th style="border-bottom: 1px solid #444444; padding: 10px;"
									class="th">번호</th>
								<th class="th">제목</th>
								<th class="th">작성자</th>
								<th class="th">날짜</th>
								<th class="th">조회수</th>
							</tr>
							<c:forEach items="${ requestScope.list }" var="n">
								<tr>
									<td class="td"><%=num++%></td>
									<!-- 공지 제목 클릭시 상세보기로 넘어가게 처리 -->
									<td class="td"><c:url var="ndt" value="ndetail.do">
											<c:param name="notice_no" value="${ n.notice_no }" />
											<c:param name="page" value="${ currentPage }" />
										</c:url> <a href="${ ndt }">${ n.notice_title }</a></td>
									<td class="td">${ n.user_id }</td>
									<td class="td"><fmt:formatDate value="${ n.notice_date }"
											type="date" pattern="yyyy-MM-dd" /></td>
									<td class="td">${ n.notice_count }</td>
								</tr>
							</c:forEach>
						</table>
						<br>
						<c:import url="/WEB-INF/views/common/paging.jsp" />
						<!-- =============================================================================== -->
					</div>
					<br>
					<!-- 로그인한 회원이 관리자인 경우는 공지사항 등록 버튼이 보이게 함 -->
					<c:if test="${ loginMember.admin_ok eq 'Y' }">
							<button style="background-color: white;"
								class="btn btn-primary btn-block"
								onclick="javascript:location.href='noticeWrite.do';">공지
								등록</button>
						</c:if>
					<br>
					<!-- 검색 항목 -->
					<center>
						<div
							style="background-color: white; border-radius: 0.5rem; border: 1px solid; padding: 5px; margin: 5px; margin-bottom: 3%">
							<div>
								<h2>검색할 항목을 선택하세요.</h2>
								<input type="radio" name="item" value="title" checked>
								제목 &nbsp; &nbsp; <input type="radio" name="item" value="writer">
								작성자 &nbsp; &nbsp; <input type="radio" name="item" value="date">
								날짜
							</div>
							<div id="titleDiv">
								<form action="bsearchTitle.do" method="post">
									<label>검색할 제목을 입력하세요 : <input type="search"
										name="keyword"></label> <input style="margin-bottom: 0.7%;"
										class="btn btn-outline-secondary" type="submit" value="검색">
								</form>
							</div>
							<div id="writerDiv">
								<form action="bsearchWriter.do" method="post">
									<label>검색할 작성자를 입력하세요 : <input type="search"
										name="keyword"></label> <input style="margin-bottom: 0.7%;"
										class="btn btn-outline-secondary" type="submit" value="검색">
								</form>
							</div>
							<div id="dateDiv">
								<form action="bsearchDate.do" method="post">
									<label>검색할 날짜를 입력하세요 : <input type="date" name="begin">
										~ <input type="date" name="end"></label> <input
										style="margin-bottom: 0.7%;" class="btn btn-outline-secondary"
										type="submit" value="검색">
								</form>
							</div>
							<button style="margin-bottom: 1%;"
								class="btn btn-outline-secondary"
								onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/nlist.do;'">전체
								보기</button>
						</div>
					</center>
					<!-- =============================================================================== -->

				</div>
			</div>
		</div>
	</section>
	<br>
	<br>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
