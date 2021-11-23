<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 자료검색 > 도서검색</title>
</head>
<link rel="stylesheet" href="/resources/css/search/book_detail.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script 
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>대출베스트</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/search/book">
                                <img src="/resources/imges/search/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/search/book">자료검색</a>
                        </li>
                        <li>
                            <a href="/search/best-book">대출베스트</a>
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
                <div class="content" style="">
                    <div class="doc">
                        <div class="wrapper-bbs" style="">


                            <!-- 테이블 -->
                            <div class="table-wrap">
                            
                                <h2>도서의 상세 내용을 확인하세요</h2>
                                
                                <table>
                                
                                    <thead>
                                    
                                        <tr>
                                            <th style="width: 200px;">이미지</th>
                                            <th style="">도서 정보</th>
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td class="">
                                                <img src="${book.book_cover }" style="width: 200px;">
                                            </td>
                                            <td class="" style="text-align: left;">
                                                <h2>${book.book_title }</h2>
                                                <p><b>저자명</b> : ${book.book_author }</p>
                                                <p><b>출판사</b>: ${book.book_publisher }</p>
                                                <p><b>출간일</b> : ${book.book_pubDate }</p>
                                                <p>
                                                <b>가격</b>: 
                                                <fmt:formatNumber value="${book.priceStandard }" type="currency"/>
                                                </p>
                                            </td>

                                        </tr>
                                        
                                    </tbody>
                                    
                                </table>

                            </div>

                        </div>

                    </div>
                    
                    <div style="display: flex; justify-content: center; align-items: center;">
                    
                        <form id="loan" onsubmit="return false;" method="post">
                        
                       		<sec:authorize access="isAuthenticated()">
							<input type="hidden" class="user_id" name="user_id" 
								value=<sec:authentication property="principal.dto.user_id"/>>
							<input type="hidden" class="user_email" name="user_email" 
								value=<sec:authentication property="principal.dto.user_email"/>>
							</sec:authorize>
							
							<sec:authorize access="isAnonymous()">
							<input type="hidden" class="user_id" name="user_id">
							</sec:authorize>
							
							<input type="hidden" name="book_title" value="${book.book_title }">
							<input type="hidden" name="book_author" value="${book.book_author }">
							<input type="hidden" class="book_isbn" name="book_isbn" value="${book.book_isbn }">
							<input type="hidden" name="book_cover" value="${book.book_cover }">
							<input type="hidden" name="book_pubDate" value="${book.book_pubDate }">
							<input type="hidden" name="book_publisher" value="${book.book_publisher }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
                            <button id="loan_btn" class=" btn2">대출 (${count }  / 2)</button>
                        </form>

                        <span>　</span>

                        <form action="/search/best-book">
                            <button class="btn3" style="display: flex; justify-content: center; align-items: center;">
                                <img src="/resources/imges/search/book_icon.png" style="width: 30px;">　목록
                            </button>
                        </form>

                    </div>

                    <h3>책 소개</h3>
                    <div style="border: 1px solid #ccc; height: 500px;">
                        상품 설명
                        ${book.description}

                    </div>

                </div>

            </div>
            
        </div>
        
    </div>
    
    <div class="pageInfo" style="text-align: center">
		
			<c:if test="${pageMaker.prev }">
				<a href="${pageMaker.startPage - 1}">이전</a>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			
				<c:if test="${num != 0}">
					<a href="${num }">${num }</a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<a href="${pageMaker.endPage + 1}">다음</a>
			</c:if>
		</div>
	
	
	<form method="get" class="moveForm"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
	
	<script>
	
		$(function() {
			$(".sub2").addClass("active");
			
			$("#loan_btn").click(function() {
				
				let id = $('.user_id').val(); 
				let book_isbn = $('.book_isbn').val(); 
				if(id == "") {
					alert("로그인 후 이용해주세요");
				} else {
					
					let data = {
	           				user_id: id,
	           				book_isbn: book_isbn
	           		};
					
					$.ajax({
	           			type: "post",
	           			url: "/search/statusChk",
	           			data: data,
	           			success: function(result) {
	           				
	           				if (result == "success") {
	           					alert("대출이 완료되었습니다.");
	           					$("#loan").attr("action", "/search/loan?detail=true");
	           					$("#loan").attr("onsubmit", "return true;");
	           					$("#loan").submit();
	       						
	           				} else {
	           					alert("대출이 불가능한 상태입니다.");
	           				}
	           			}
	           		});
					
				}
					
			});			
		});
	</script>
			

</body>
</html>
