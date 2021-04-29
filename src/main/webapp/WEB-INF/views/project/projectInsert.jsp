<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style type="text/css">
#sample{
display:none;
}
</style>

<title>PROJECT UPLOAD</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">


		<h1>ProjectUplod</h1>

		<br>
		<!-- Nav tabs -->
		<div class="form-group">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#home">프로젝트 개요</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#menu1">펀딩 및 선물 구성</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#menu2">스토리 텔링</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#menu3">계좌 설정</a></li>
				<li>
					<div class="btn-group">
						<button type="button" class="btn btn-outline-secondary" id="tempSave">임시저장</button>
						<button type="button" class="btn btn-outline-primary" id="submit">제출</button>
					</div>
				</li>
			</ul>
		</div>
		<!-- Tab panes -->
		<form action="./projectUpdate" method="post" id="frm"
			enctype="multipart/form-data">


			<div class="tab-content">
				<div id="home" class="container tab-pane active">
					<br>
					<h3>프로젝트 개요</h3>
					<input type="hidden" id="state" name="state" value=""> <input
						type="hidden" name="id" value="${projectDTO.id}"> <input
						type="hidden" id="projectNum" name="num" value="${projectDTO.num}"> <input
						type="hidden" name="media_id" value="${projectDTO.media_id}">
					<div class="form-group">
						<label>프로젝트 제목</label> <input type="text" class="form-control"
							id="title" name="title" value="${projectDTO.title}">
						<p id="titleCheckResult"></p>
					</div>

					<div class="form-group">
						<label>프로젝트 대표 이미지</label>
						<div >
							<c:forEach items="${projectDTO.mediaFiles}" var="media">
								<c:if test="${media.division eq 'photo'}">
									<img id="nullCheck" src="../resources/images/project/f/${projectDTO.num}/${media.fileName}">
									<button type="button"
										class="btn btn-outline-secondary btn-block fileDelete"
										id="fileNum"
										title="${media.fileNum}">대표이미지 교체</button>
								</c:if>
							</c:forEach>
						</div>
						<div id="upload">
						</div>
						<input type="button" value="add" class="btn btn-outline-danger" id="add" style="display:none;">


					</div>
					<div class="form-group">
						<label>프로젝트 요약</label> <br>
						<textarea style="resize: none;" class="form-control" rows="5"
							id="summary" name="summary">${projectDTO.summary}</textarea>
						<p id="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label for="title">프로젝트 카테고리</label> <select class="form-control"
							id="category" name="category" title="${projectDTO.category}">
							<option>카테고리 선택</option>
							<option>a</option>
							<option>b</option>
							<option>c</option>
							<option>d</option>
							<option>e</option>
						</select>
						<p id="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label>프로젝트 페이지 주소</label> <input type="text" class="form-control"
							id="urlAddress" name="urlAddress"
							value="${projectDTO.urlAddress}">
						<p id="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label>검색용 태그</label> <input type="text" class="form-control"
							id="search_id" name="search_id" value="${projectDTO.search_id}">
						<p id="titleCheckResult"></p>
					</div>
					<h3>창작자 정보</h3>

					<div class="form-group">
						<label>창작자 이름</label> <input type="text" class="form-control"
							id="makerName" name="makerName" value="${projectDTO.makerName}">
						<p id="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label>창작자 소개</label> <br>
						<textarea name="makerSummary" style="resize: none;" id="contents"
							class="myCheck">${projectDTO.makerSummary}</textarea>

						<p id="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label>장작자 활동 지역</label> <input type="text" class="form-control"
							id="makerLocation" name="makerLocation"
							value="${projectDTO.makerLocation}">
						<p id="titleCheckResult"></p>
					</div>

				</div>





				<div id="menu1" class="container tab-pane fade">
					<br>
					<h3>펀딩 목표 설정</h3>
					<div class="form-group">
						<label for="title">목표 금액</label> <input type="text"
							class="form-control" id="targetAmount" name="targetAmount"
							value="${projectDTO.targetAmount}">
						<p id="titleCheckResult"></p>
					</div>
					<h3>펀딩 기간 설정</h3>
					<div class="form-group">
						<label>프로젝트 공개일시</label> <input type="date"
							class="form-control" id="openDate" name="openDate"
							value="${projectDTO.openDate}">
						<p id="titleCheckResult"></p>
					</div>
					<div class="form-group">
						<label>프로젝트 마감일</label> <input type="date"
							class="form-control" id="closeDate" name="closeDate"
							value="${projectDTO.closeDate}">
						<p id="titleCheckResult"></p>
					</div>
					
				</div>


				<div id="menu2" class="container tab-pane fade">
					<!-- 
					<br> <label>프로젝트 소개 영상</label>
					<div class="input-group">
							<div class="custom-file">
								<input type="file" id="inputGroupFile04"
									class="form-control-file border" name="files">
							</div>
						
						</div>
						 -->
					<h3>프로젝트 스토리</h3>
					<div class="form-group">
						<label for="title">프로젝트 스토리</label> <br>
						<textarea name="projectStory" style="resize: none;"
							id="projectStory" class="myCheck">${projectDTO.projectStory}</textarea>

						<p id="titleCheckResult"></p>
					</div>
				</div>


				<div id="menu3" class="container tab-pane fade">
					<br>
					<h3>이메일 인증</h3>
					<div class="form-group">
						<label for="title">이메일 주소</label> <input type="text"
							class="form-control" id="email" name="email"
							value="${projectDTO.email}">
						<p id="titleCheckResult"></p>
					</div>
					<h3>본인 인증</h3>
					<div class="form-group">
						<label for="title">휴대폰 번호</label> <input type="text"
							class="form-control" id="phone" name="phone"
							value="${project.phone}">
						<p id="titleCheckResult"></p>
					</div>
					<h3>입금 계좌</h3>
					<div class="form-group">
						<label for="title">입금 계좌</label> <input type="text"
							class="form-control" id="bankAccount" name="bankAccount"
							value="${projectDTO.bankAccount}">
						<p id="titleCheckResult"></p>
					</div>
					<h3>세금 계산서 발행</h3>
					<div class="form-group">
						<label for="title">세금 계산서</label> <input type="text"
							class="form-control" id="taxReceipt" name="taxReceipt"
							value="${projectDTO.taxReceipt}">
						<p id="titleCheckResult"></p>
					</div>

				</div>
			</div>
		</form>
	</div>
	<div id="sample">
		<div class="custom-file">
			<input type="file" id="inputGroupFile04" id="thumbNail"
				class="form-control-file border" name="files">
		</div>
		<p>jpeg, png파일만 가능합니다.</p>
		<p id="titleCheckResult">jpeg, png파일만 가능합니다.</p>

	</div>
	<script type="text/javascript"
		src="../resources/jquery/projectInsert.js"></script>
	<script type="text/javascript" src="../resources/jquery/summerFile.js"></script>
</body>
</html>