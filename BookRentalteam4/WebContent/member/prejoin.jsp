<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:if test="${result == 1 }">
	<script>
	alert("회원가입 성공!!!!");
	location.href="./member/main.jsp";
	</script>
</c:if>