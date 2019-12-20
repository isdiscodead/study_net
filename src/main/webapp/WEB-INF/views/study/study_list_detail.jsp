﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스터디 상세 정보</title>
	
	<script>
		
		function send_apply(max_count,approve_count,idx){
			
			var btn=document.getElementById("btn");
			if(max_count==approve_count){
				btn.disabled='disabled';
				$('#btn').css('background-color','#DEE0E3');
			}

		 	location.href= "study_apply_caution.do?idx=" + idx;
			
		}
	
	</script>
	
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="study-list-detail">
		<div class="inner-box pt190">
			<div class="contents-box board">
				<h2 class="mb20">${study.title}</h2>
				<div class="flex-box bg-blue">
					<span><fmt:formatDate value="${study.created_at }"  pattern="YYYY.MM.dd"/></span>
					<div>
						<span>개설자:</span>
						<h3>${user.name}</h3>
					</div>
				</div>
				<div class="recruit-info">
					<span class="mb10 image">
						<img src="resources/images/study_profile/${study.photo}.jpg">
					</span>
					
					<div>
						<span>스터디 목적</span>
						<span>${study.purpose}</span>
					</div>
					<div>
						<span>모집 마감</span>
						<span><fmt:formatDate value="${study.deadline}"  pattern="YYYY.MM.dd"/></span>
					</div>
					<div>
						<span>모집 인원(최소/최대)</span>
						<span>${study.min_count}명 / ${study.max_count}명</span>
					</div>
					<div>
						<span>모임 장소</span>
						<span>${study.place}</span>
					</div>
				</div>
				<div class="recruit-condition">
					<h2>모집 조건</h2>
					<p>
						${study.apply_condition}
					</p>
				</div>
				<div class="recruit-detail-info mb30">
					<h2>세부 정보</h2>
					<p>
						-- 추가정보<br>
						${study.extra_info}<br><br>
						-- 상세설명 <br>
						${study.detail_info}<br>
					</p>
				</div>
				<div class="mb40 tac">
				<c:if test=""></c:if>
					<input id="btn" class="my-btn yellow-black" type="button" value="신청하기" onclick="send_apply(${study.max_count},${study.approve_count});"> 
					<input class="my-btn  yellow-black" type="button" value="목록으로" onclick="location.href='study_list.do'">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>