<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
<!-- --------------------------------------------------------------- -->
<title>예약 목록</title>
</head>
<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>
	
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<br>
	<ul class="admin_page">
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/member.main.jsp"> MENU</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/UpdateForm.do">내 정보</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/booksearchaction.do">도서검색</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/rentListAction.do">대출 목록</a> </li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/ReserveList.do">예약 목록</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">회원게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">1:1문의 게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/Logout.do">로그아웃</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/DeleteMember.do">회원탈퇴</a></li>
</ul>
</c:if>
	
	<form method="post"  >
	<div style="margin-top:1%; margin-left: 20%; width:60%;">

	
	<table border = 0 width=450 align=center cellpadding=15px class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	    <div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">예약목록</div>
			<tr valign="top" align = center style="font-size:25px;">
					<th>도서번호</th>
					<th>도서명</th>
					<th>저자</th>
					<th>출판사</th>
					<th>예약신청일</th>
					<th>현 대출자 반납일</th>
					<th>예약취소</th>

				</tr> 
			<c:forEach var="rv" items="${reservelist}">

			<tr align = center valign = center>
				<th>${rv.book_Num}</th>
				<th><a href="./ReviewListAction.do?num=${rv.book_Num}">
					${rv.book_Name }
				</a></th>
				<th>${rv.writer}</th>
				<th>${rv.publisher} </th>
				<th>${rv.reserve_Date}</th>
				<th>${rv.return_date}</th>
					<td align = center>
					<input type=button value="예약취소" id="reviewWrite" 
						   onClick="location.href='<%=request.getContextPath()%>/rent_numPassingAction.do?book_Num=${r.book_Num}'">
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</form>

</body>
</html>