<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<a href="./bookupdateform.do">도서 작성</a> <br>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>



<div class="container col-sm-20">
도서 개수 : ${listcount} 개<br>
  <p>현재 시스템에 입력되있는 도서의 목록입니다</p>  
            
  <table border="0" width="600" align="center" class="table table-hover" style="font-family: 'Nanum Gothic', sans-serif;">
    
        <caption align="right">
        <input type="text" name="text" placeholder="검색어">
        <input type="submit" value="검색"></caption>
        <thead>
		<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">도서 목록</div></td></tr>
		</thead>
		<tr align ="center">
		<th>도서번호</th>
		<th>도서명</th>
		<th>글쓴이</th>
		<th>출판사</th>
		<th>장르</th>
		</tr>
		
		 <tbody>
	<c:set var="num" value="${listcount - (page-1) * 10}" />
	<c:forEach var="b" items="${booklist}">
		<tr>
			<td>${b.book_Num}
			<c:set var="num" value="${num-1}" />
			</td>
			<td>
			<a href="./bookDetailAction.do?book_Num=${b.book_Num}&page=${page}">${b.book_Name}</a>
			</td>
			<td>${b.writer}</td>
			<td>${b.publisher}</td>
			<td>${b.genre}</td>
			
		</tr>
		
	</c:forEach>
</tbody>
</table> <br><br>
</div>
<div class="container col-sm-8" style="font-family: 'Nanum Gothic', sans-serif;">

		<div style="float:left;"><input type="button" class="btn btn-outline-secondary btn-sm" value="   목록   " onClick="location.href='./member_board_list.do'"></div>
	<c:if test="${not empty sessionScope.id }">
		<div style="float:right;"><input type="button" class="btn btn-outline-secondary btn-sm" value="   작성   " onClick="location.href='./member_board_writeform.do'"></div>
	</c:if>

</div>
		
		
		<!-- 페이지 처리 -->
<center>
<c:if test="${listcount > 0}">

<!-- 1페이지로 이동 -->
<a href="./booklistaction.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="./booklistaction.do?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">	<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
		<a href="./booklistaction.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동  -->
<c:if test="${endPage < pageCount}">
	<a href="./booklistaction.do?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="./booklistaction.do?page=${pageCount}"
	style="text-decoration:none"> >> </a>

</c:if>
</center>






</body>
</html>