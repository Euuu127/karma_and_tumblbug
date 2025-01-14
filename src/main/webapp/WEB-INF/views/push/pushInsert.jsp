<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">


		<h2>프로젝트</h2>
		<h3>${projectDTO.title}</h3>
		<h2>후원 금액</h2>
		<h3>${push.quantity}원</h3>
		<form action="./pushInsert" method="post">
			<input type="hidden" name="id" value="${push.id}"> <input
				type="hidden" name="projectNum" value="${push.projectNum}">
			<input type="hidden" name="quantity" value="${push.quantity}">

			<select class="form-control" name="paymentNum">
				<option>결제 수단 선택</option>
				<c:forEach items="${payList}" var="pay">
					<c:if test="${pay.division eq 'account'}">
						<option value="${pay.num}">${pay.division}-${pay.bankName},${pay.bankAccount}</option>
					</c:if>
					<c:if test="${pay.division eq 'card'}">
						<option value="${pay.num}">${pay.division}-${pay.cardNumber}</option>
					</c:if>
				</c:forEach>
			</select>
			<br>
			<button type="submit" class="btn btn-outline-primary btn-block">후원하기</button>
		</form>
	</div>
</body>
</html>