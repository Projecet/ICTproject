<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

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


<!-- Core theme JS-->
<script src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>
<script type="text/javascript">
	function showWrite(){
	   location.href = "${ pageContext.servletContext.contextPath }/bwform.do";
	}
</script>   

<!-- 게시글 상세 -->
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		showDiv();
		
		$("input[name=item]").on("change", function(){
			showDiv();
		});
	});
	
	function showDiv(){
		if($("input[name=item]").eq(0).is(":checked")){
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if($("input[name=item]").eq(2).is(":checked")){
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
		    <div style="background-color: #1a1a1a;  border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;" class="row">
		        <div class="col-xl-9 mx-auto">
		        <br>
			        <p style="color: white; font-size: 35px;" align="center"><b>게시글 상세보기</b></p>
					<br>
		            <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->
						<table style=" border-collapse: collapse; width: 100%;background: white; border-radius: 1rem; border: 1px solid; padding: 5px; margin: 5px;text-align: center;"align="center" cellspacing="0" cellpadding="15">
							<tr>
							<th class="th">제     목</th><td class="td" style="margin-top: 6%;"  readonly>${board.board_title }</td>
							<th class="th">작 성 자</th><td class="td" readonly>${board.user_id }</td>
							<th class="th">날     짜</th>
							<td class="td" readonly><fmt:formatDate value="${board.board_date }" type="date" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<th class="th">첨부파일</th>
								<td class="td" colspan="5">
									<c:if test="${!empty board.board_original_img }"><!-- 첨부 파일이 있으면 다운로드 요청 -->
										<c:url var="bfd" value="/bfdown.do">
											<c:param name="ofile" value="${board.board_original_img }"/>
											<c:param name="rfile" value="${board.board_rename_img }"/>
										</c:url>
										<a readonly align="left" class="btn btn-primary btn-block" href="${ bfd }">${board.board_original_img }</a>
									</c:if>
									<c:if test="${empty board.board_original_img }"><!-- 첨부 파일이 없으면 공백문자 처리 -->
										&nbsp;
									</c:if>
								</td>
							</tr>
							<tr><th class="th">내     용</th><td class="td" style="margin-left: 10%;" colspan="5"><textarea class="form-control" name="board_content" rows="5" cols="50" readonly>${board.board_content }</textarea></td></tr>
						</table>
<!-- =============================================================================== -->
					</div>
					<br>
					<div style=" padding: 5px; margin: 5px; margin-bottom: 3%" align="center" >
						<button style="margin-bottom: 1%; background-color: #fff; color: #000;" class="btn btn-outline-secondary" onclick="javascript:location.href='blist.do';">목록</button>
						
						<!-- 본인이 등록한 글일때 수정 삭제 -->
						<c:if test="${board.user_id eq sessionScope.loginMember.user_id}">
							<c:url var="bup" value="/bupview.do">
								<c:param name="board_no" value="${ board.board_no }" />
								<c:param name="page" value="${ currentPage }" />
							</c:url>
							
							<a style="background-color: white;" class="btn btn-primary btn-block" href="${ bup }">수정</a>
							<c:url var="bdt" value="/bdel.do">
								<c:param name="board_no" value="${ board.board_no }" />
								<c:param name="board_rename_img" value="${ board.board_rename_img }" />
							</c:url>
							<a style="background-color: white;" class="btn btn-primary btn-block" href="${ bdt }">삭제</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>