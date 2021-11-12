<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
</head>
<link rel="stylesheet" href="/resources/css/board/sub4/sb_page.css">
<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>분실물찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="#">분실물찾기</a>
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
	                                <span style="margin-right: 10px;"> 총 게시물 : <b>${total}</b>건</span>
	                                
	                                <select name="amount">
	                                
	                                 <c:if test="${pageMaker.cri.amount == 10}">
	                                       <option value="10" selected="selected">10개씩 보기</option>
	                                       <option value="20">20개씩 보기</option>
	                                       <option value="30">30개씩 보기</option>
	                                       <option value="40">40개씩 보기</option>
	                                 </c:if>
                                   
                                    <c:if test="${pageMaker.cri.amount == 20 }"> 
                                       <option value="10">10개씩 보기</option>
                                       <option value="20" selected="selected">20개씩 보기</option>
                                       <option value="30">30개씩 보기</option>
                                       <option value="40">40개씩 보기</option>
                                   	</c:if>
                                                                      
                                   	<c:if test="${pageMaker.cri.amount == 30 }"> 
                                       <option value="10">10개씩 보기</option>
                                       <option value="20">20개씩 보기</option>
                                       <option value="30" selected="selected">30개씩 보기</option>
                                       <option value="40">40개씩 보기</option>
                                   	</c:if>
                                                                 
                                 	<c:if test="${pageMaker.cri.amount == 40 }"> 
                                       <option value="10">10개씩 보기</option>
                                       <option value="20">20개씩 보기</option>
                                       <option value="30">30개씩 보기</option>
                                       <option value="40" selected="selected">40개씩 보기</option>
                                   </c:if>

								  </select>
								 <button class="btn">이동</button>
								<input type="hidden" name="page" value="1">                              
                                
							</form>
							
                         </div>
						
						<div class="search">
							<form action="/articleList" method="get">
								<input type="hidden" name="page" value="${pageMaker.cri.page}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								
								<select name="type">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="TC">제목+내용</option>
								</select>
								
								<input type="text" name="keyword">
								<input type="submit" value="검색">
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
                                    <c:forEach var="articleList" items="${articleList}">
                                        <tr>
                                            <td class="num">${articleList.article_no}</td>
                                            <td class="left" style="padding-left: 15px;"><a class="move" href="/board/articleContent?amount=${pageMaker.cri.amount}&page=${pageMaker.cri.page}&article_no=${articleList.article_no}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${articleList.article_title}</a></td>
                                         
                                             <%--   <a href="/articleContent?article_no=${articleList.article_no}">${articleList.notice_title}</a> --%>
                                            
                                            <td>${articleList.writer_name}</td>
                                            <td>
                                               <fmt:formatDate var="article_reg_date" value="${articleList.article_reg_date}" pattern="yyyy-MM-dd"/>
                                    				${article_reg_date}
                                            </td>
                                          <td>${articleList.article_views}</td>
                                        </tr>
                                    </c:forEach>   
                                    </tbody>
                                </table>
                                
                                 <div class="pageInfo">
									<c:if test="${pageMaker.prev}">
										<a href="${pageMaker.startPage - 1}">이전</a>	
									</c:if>
									
									<!-- 각 번호 페이지 버튼 -->
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									
										<a href="${num}">${num}</a>			
									</c:forEach>	
									
									<!-- 다음 페이지 버튼 -->
									<c:if test="${pageMaker.next}">
										<a href="${pageMaker.endPage + 1}">다음</a>	
									</c:if>
										
								</div>
                              
                              <!-- 글쓰기 btn --> 
                              <div class="write">
                                <button onclick="location.href='/board/articleInsertForm'" class="btn">글쓰기</button>
                              </div>
                                                                
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
   
			
	<!-- <form method="/articleList" class="moveForm"> -->	
	<form method="get" id="moveForm">
		<input type="hidden" name="page" value="${pageMaker.cri.page}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
   $(function() {
   		$(".sub4").addClass("active");  
      
		var moveForm = $("#moveForm");
      
     /*  $(".move").on("click", function(e){
          e.preventDefault();
          
          moveForm.append("<input type='hidden' name='article_no' value='"+ $(this).attr("href")+ "'>");
          moveForm.attr("action", "/articleContent");
          moveForm.submit();
      }); */
      
      $(".pageInfo a").on("click", function(e) {			
			e.preventDefault();
			
			moveForm.find("input[name = 'page']").val($(this).attr("href"));
			moveForm.attr("action", "/board/articleList"); 
			moveForm.submit();			
		});
   })
</script>
</body>
</html>