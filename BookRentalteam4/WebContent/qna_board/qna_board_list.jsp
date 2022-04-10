<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
select{height:35px; font-size:16px;}
input{height:35px; font-size:16px;}
th{height:35px; font-size:16px;}
td{height:30px; font-size:14px;}
.search_btn{height:33px;font-size:16px;}

</style>
현재 아이디 : ${sessionScope.id} <br>
현재 등급 : ${sessionScope.member_grade }	<br>
<c:if test="${sessionScope.member_grade==0 }">
		<a href="./qna_BoardForm.do">문의 작성하기</a> <br> <!-- 일반회원일 때만 문의 작성하기 보이게 만들기 -->		
</c:if>

<center>
<c:if test="${sessionScope.member_grade==1}">
		<h5>~관리자님 환영합니다~</h5> <br> <!-- 일반회원일 때만 문의 작성하기 보이게 만들기 -->		
</c:if>
   <div style="padding:10px; height:30px; border:0px solid red;" >
      <select name="key">
         <option value="0">제목</option>
         <option value="1">작성자</option>
      </select>
      
      <input type="text">
   
   </div>
	<table width=800 border="1" style="border-collapse:collapse;border-cellspacing:10px;">
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				
			</tr>	
		<c:forEach var="b" items="${boardlist}">			
			
			<tr>
		<td> 
			<c:if test="${b.qb_lev>0}">
				<c:forEach var="i" begin="0" end="${b.qb_lev}">
					&nbsp;
				</c:forEach>
			</c:if>
			<a href="./qna_BoardDetailAction.do?qb_num=${b.qb_num}&page=${page}">">${b.qb_subject }</a>
 		</td>
		<td> ${b.id} </td>
		<td> <fmt:formatDate value="${b.qb_regdate}" pattern="yy.MM.dd hh:mm"/> </td>
		<!-- 날짜 표기 시, date클래스 객체 생성해 현재시간 구해서 비교해보고
		날짜가 같으면 시간만 표시, 날짜가 다를 경우 작성 날짜가 뜨도록 변경 -->
	
	</tr>		
			</c:forEach>	
	</table>

<!-- 다음 블럭으로 이동  -->
<!-- 페이지 목록 -->
<center>
<c:if test="${listcount>0}"> <!-- 글이 존재하는 경우에만 페이지 출력 -->
<!-- 1페이지로 -->
	<a href="./qb_board_list.do?page=1" style="text-decoration:none"> << </a>
<!-- 이전 페이지 -->
	<c:if test="${page>1 }">
		<a href="./qb_board_list.do?page=${page-1 }"> < </a>
	</c:if>

	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i==page }">  <!-- 현재 페이지 -->
			[${i}]
		</c:if>
		<c:if test="${i!=page }"> <!-- 현재 페이지가 아닌 경우 -->
			<a href="./qb_board_list.do?page=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>
	
<!-- 다음 페이지 -->
	<c:if test="${page <pageCount}">
		<a href="./qb_board_list.do?page=${page+1 }"> > </a></c:if>
<!-- 끝페이지로 -->
	<a href="./qb_board_list.do?page=${pageCount}" style="text-decoration:none"> >> </a>
		
</c:if>
</center>


<!-- 마지막 페이지로 이동 -->


</center>
