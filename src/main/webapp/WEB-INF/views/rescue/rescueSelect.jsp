<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
 <br>
		<h2> 구조 동물 입력 8</h2>
	<form id="frm"  enctype="multipart/form-data">
	
	
  	<div class="row">
	  	  <div class="col">
	  	  	    <label for="status" class="mr-sm-2">게시판 종류 </label>
  		        <input type="text" value="${dto.status}" class="form-control mb-2 mr-sm-2" name="status" id="status">
	  	  </div>
	  	  <div class="col">
	  	  	   <label for="resDate" class="mr-sm-2">구조일 </label>
  		       <input type="text" value="${dto.resDate}" class="form-control  mb-2 mr-sm-2" id="resDate" name="resDate">
	  	  </div>
    </div>
   </div>
	   	  
	   	 
  	
  	<div class="row">
     
	  	  <div class="col">
	  	  		<label for="sn" class="mr-sm-2">시리얼 넘버</label>
  		        <input type="text" value="" class="form-control mb-2 mr-sm-2" name="sn" id="sn">
	  	  </div>
	
	  	  <div class="col">
	  	    	<label for="zoneSn" class="mr-sm-2">지역 시리얼 넘버</label>
  		        <input type="text" class="form-control mb-2 mr-sm-2" name="zoneSn" id="zoneSn">
	  	  </div>
    </div>
    
      <div class="form-group">
       <label for="province"> 구조장소 </label>
    <div class="row">
     
	  	  <div class="col">
	  	         
	  	  	       <select onchange="categoryChange(this)" name="province" id="province" class="custom-select">
					 <option value="" disabled selected hidden> 지역구를 선택해주세요 </option>
					    <option value="s">서울특별시</option>
					    <option value="g">경기도</option>
					    <option value="i">인천광역시</option>
					</select>
		   </div>
		  <div class="col">
					<select id="city" name="city" class="custom-select">
					    <option value="" disabled selected hidden> 지역구를 선택해주세요 </option>
					</select>
	  	  </div> 
	  	 
	  	  <div class="col">
  		        <input type="text" class="form-control mb-2 mr-sm-2" name="location" placeholder="나머지주소" id="location">
	  	  </div>
    </div>
    </div>
  	
    
    <div class="row">
	  	  <div class="col">
	  	  	    <label for="species" class="mr-sm-2">축종</label>
  		        <input type="text" class="form-control mb-2 mr-sm-2" name="species" id="species">
	  	  </div>
	  	  <div class="col">
	  	  	   <label for="kind" class="mr-sm-2">종류</label>
  		       <input type="text" class="form-control mb-2 mr-sm-2" name="kind" id="kind">
	  	  </div>
    </div>
    
   <div class="row">
	  	  <div class="col">
    		<label for="sex">sex</label>
    		<input type="text" class="form-control etc myCheck" id="sex" name="sex" >
   		</div>
  
	  	  <div class="col">
   			 <label for="age">age</label>
    		<input type="text" class="form-control etc myCheck" id="age" name="age" >
    		
  		</div>
   </div>
    
    
    <div class="row">
	  	  <div class="col">
	  	       <label for="color" class="mr-sm-2">모색</label>
  		        <input type="text" class="form-control mb-2 mr-sm-2" name="color" id="color">
	  	  </div>
	  	  <div class="col">
	  	        <label for="desex" class="mr-sm-2">중성화 수술</label>
  		        <input type="text" class="form-control mb-2 mr-sm-2" name="desex" id="desex">
	  	  </div>
    </div>
    
    <div class="row">
	  	  <div class="col">
	  	         <label for="character" class="mr-sm-2">성격</label>
  		         <input type="text" class="form-control mb-2 mr-sm-2" name="character" id="character">
	  	  </div>
	  	  <div class="col">
	  	  		<label for="weight" class="mr-sm-2">체중</label>
  		        <input type="text" value="0.0" class="form-control mb-2 mr-sm-2" name="weight" id="weight">kg
	  	  </div>
    </div>
    
    <div class="row">
	  	  <div class="col">
	  	  		<label for="health" class="mr-sm-2">건강상태</label>
  		        <input type="text" class="form-control mb-2 mr-sm-2" name="health" id="health">
	  	  </div>
	  	  <div class="col">
	  	  		
	  	  </div>
    </div>
    
    <div class="row">
	  	  <div class="col">
	  	  	  <label for="feature">특징</label>
      	       <textarea class="form-control" rows="5" id="feature" name="feature" id="feature"> </textarea>
	  	  </div>
    </div>
    <br>
    <div class="row">
	  	  <div class="col">
	  	  		<label for="adoptDate" class="mr-sm-2" > 입양일 </label>
	  		    <input id="adoptDate" name="adoptDate" type="date" >	   	
	  	  </div>
	  	  <div class="col">
	  	  	   <label for="returnDate" class="mr-sm-2"> 반환일 </label>
	  		   <input id="returnDate" name="returnDate" type="date" >	   	
	  	  </div>
    </div>
    
   <!--  <div class="form-group">
   		 <label for="file">file</label>
    	 <input type="file" class="form-control etc" id="avatar" name="avatar" >
  	</div> -->
  
   

   <input type="button" id="btn" value="입력" class="btn btn-primary">
  <a href="./rescueInsert"><input type="button" id="back" value="취소" class="btn btn-primary"></a>
</form>
 


</div>

</body>
</html>