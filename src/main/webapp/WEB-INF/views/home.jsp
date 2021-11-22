<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.dto"/><br>
		<sec:authentication property="principal.dto.user_id"/>님 반갑습니다.<br>
		당신은 <sec:authentication property="principal.dto.authList"/> 권한입니다. <br>
		<br><button>로그아웃하러가기</button>
</sec:authorize>
</body>
</html>
