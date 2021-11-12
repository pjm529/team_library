<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 열린공간 > 묻고답하기</title>
</head>
<link rel="stylesheet" href="/resources/css/board/sb_page.css">
<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/board/noticeList">열린공간</a> 
                        </li>
                        <li>
                            <a href="/board/noticeList">공지사항</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="../lnb.jsp"></jsp:include>

                <!-- 본문 -->
                <div class="content">
                    <div class="doc"> 
                        <div class="wrapper-bbs">
                            <!-- 게시물 수 -->
                            <div class="inline">
                            	<form action="">
                            		<input type="hidden" name="type" value="${pageMaker.cri.type}">
                                	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                            	
	                                <span style="margin-right: 10px;"> 총 게시물 : <b>${total}</b> 건</span>
	                                <select name="amount">
	                                
	                                <c:if test="${pageMaker.cri.amount == 10}">
	                                    <option value="10" selected="selected">10개씩 보기</option>
	                                    <option value="20">20개씩 보기</option>
	                                    <option value="30">30개씩 보기</option>
	                                    <option value="40">40개씩 보기</option>
	                                </c:if>
	                                
	                                <c:if test="${pageMaker.cri.amount == 20}"> 
	                                    <option value="10">10개씩 보기</option>
	                                    <option value="20" selected="selected">20개씩 보기</option>
	                                    <option value="30">30개씩 보기</option>
	                                    <option value="40">40개씩 보기</option>
	                                </c:if>
	                                
	                                <c:if test="${pageMaker.cri.amount == 30}"> 
	                                    <option value="10">10개씩 보기</option>
	                                    <option value="20">20개씩 보기</option>
	                                    <option value="30" selected="selected">30개씩 보기</option>
	                                    <option value="40">40개씩 보기</option>
	                                </c:if>
	                                
	                                <c:if test="${pageMaker.cri.amount == 40}"> 
	                                    <option value="10">10개씩 보기</option>
	                                    <option value="20">20개씩 보기</option>
	                                    <option value="30">30개씩 보기</option>
	                                    <option value="40" selected="selected">40개씩 보기</option>
	                                </c:if>
	                                
	                                </select>
	                                
	                                
	                                <input type="hidden" name="page" value="1">
	                                <button class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 12%;">번호</th>
                                            <th>제목</th>
                                            <th style="width: 18%;">작성자</th>
                                            <th style="width: 12%;">작성일</th>
                                            <th style="width: 15%;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="eBod" items="${qnaBoardList}">
                                        <tr>
                                            <td class="num">${eBod.enquiry_no}</td>
                                            <td class="left contentGo" style="padding-left: 15px;">
                                           		<%-- <a href="/noticeContent?amount=${pageMaker.cri.amount}&page=${pageMaker.cri.page}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&notice_no=${noticeList.notice_no}">${noticeList.notice_title}</a> --%>
 												<a href="${eBod.enquiry_no}">${eBod.enquiry_title}</a>
                                            </td>
                                            <td>${eBod.writer_name}</td>
                                            <td>
                                            	<fmt:formatDate var="enquiry_reg_date" value="${eBod.enquiry_reg_date}" pattern="yyyy-MM-dd"/>
												${enquiry_reg_date}
                                            </td>
                                            <td>${eBod.enquiry_hits}</td>
                                        </tr>
                                    </c:forEach>   
                                    </tbody>
                                </table>
                                
                                <div class="pageInfo">
									<c:if test="${pageMaker.prev}">
										<a href="${pageMaker.startPage - 1}">이전</a>
									</c:if>
								
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<a href="${num}">${num}</a>
									</c:forEach>
									
									<c:if test="${pageMaker.next}">
										<a href="${pageMaker.endPage + 1}">다음</a>
									</c:if>
								</div>
								
                                <!-- 글쓰기 btn -->
                                <div class="write">
                                    <button class="write_btn" onclick="location.href='/board/qnaBoardWrite'" style="cursor: pointer">글쓰기</button>
                                </div>
                                
                                <div class="searchBox">
                                	<form action="/board/noticeList" method="get">
                                		<input type="hidden" name="page" value="1">
                                		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                		
                                		<select name="type">
                                		<c:choose>
                                			<c:when test="${pageMaker.cri.type eq 'title'}">
                                				<option value="TC">제목+내용</option>
		                                		<option value="title" selected="selected">제목</option>
		                                		<option value="content">내용</option>
                                			</c:when>
                                			
                                			<c:when test="${pageMaker.cri.type eq 'content'}">
                                				<option value="TC">제목+내용</option>
		                                		<option value="title">제목</option>
		                                		<option value="content" selected="selected">내용</option>
                                			</c:when>
                                		
                                			<c:otherwise>
                                				<option value="TC" selected="selected">제목+내용</option>
		                                		<option value="title">제목</option>
		                                		<option value="content">내용</option>
                                			</c:otherwise>
                                		</c:choose>
                                		</select>
                                		
                                		<c:choose>
                                			<c:when test="${fn:length(pageMaker.cri.keyword) == 0}">
                                				<input type="text" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off">
                                			</c:when>
                                			<c:otherwise>
                                				<input type="text" name="keyword" value="${pageMaker.cri.keyword}" autocomplete="off">
                                			</c:otherwise>
                                		</c:choose>
                                		
                                		
                                		<input type="submit" value="검색">
                                	</form>
                                </div>
                                
                                                 
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div> 
    
    <form action="/board/qnaBoardList" method="get" class="moveForm">
		<input type="text" name="page" value="${pageMaker.cri.page}">
		<input type="text" name="amount" value="${pageMaker.cri.amount}">
		<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="text" name="type" value="${pageMaker.cri.type}">
	</form>
	
	<form action="/board/qnaBoardContent" method="get" class="moveForm2">
		<input type="hidden" name="page" value="${pageMaker.cri.page}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="enquiry_no" value="">
	</form>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(function() {
		$(".sub3").addClass("active");
		var moveForm = $(".moveForm");
		var moveForm2 = $(".moveForm2");
		
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name = 'page']").val($(this).attr("href"));
			moveForm.submit();
		})
		
		$(".contentGo a").on("click", function(e) {
			e.preventDefault();
			moveForm2.find("input[name = 'enquiry_no']").val($(this).attr("href"));
			moveForm2.attr("action", "/board/qnaBoardContent");
			moveForm2.submit();
			
		}) 
		
	})

	
</script>
</body>
</html>
