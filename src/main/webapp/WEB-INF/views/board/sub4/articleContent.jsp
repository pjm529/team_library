<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
<link rel="stylesheet" href="/resources/css/board/sub4/content_page.css">
<style>
 .wrapper-bbs{
	padding-top: 20px;
 	}

.bbs-content b {
	font-size: 140%;
	font-weight: 800;
	padding: 10px 15px;
	}

.bbs-title {
	height: 40px;
	}

.bbs-content {
	min-height: 240px;
	}

p {
	margin: 0;
	padding: 20px 15px;
	line-height: 150%;
	word-break: keep-all;
	font-size: 15px;
	font-weight: normal;
	color: #464646;
	}
</style>
</head>
<body>
<div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>분실물찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/board/articleList">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="/articleList">분실물찾기</a>
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

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table class="bbs-edit">
                                    <tbody>
                                        <!-- 제목 -->
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                                <b>${dto.article_title}</b>
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">${dto.writer_name}</td>
                                            <th class="first">작성일</th>                                            
                                            <td>
                                            	<fmt:formatDate var="article_reg_date" value="${dto.article_reg_date}" pattern="yyyy-MM-dd"/>
                                            		${article_reg_date}
                                            </td>
                                            <th class="first">조회수</th>
                                            <td>${dto.article_views}</td>
                                        </tr>

                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content">
                                                    <p>${dto.article_content}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                                <!-- 글쓰기 btn -->
                                <div class="list_wrap">
	                                
	                                <!-- '목록으로' 눌렀을 때 처음 봤던 게시물 해당목록 페이지로 가기 -->
	                                <form action="/board/articleList" method="get">	                                	
	                                	<input type="hidden" name="amount" value="${cri.amount}">
	                                	<input type="hidden" name="page" value="${cri.page}">
	                                	<input type="hidden" name="type" value="${cri.type}">
	                                	<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="list_btn">목록으로</button>
	                                </form>
	                             </div>
	                             
	                             <div class="delete_wrap">  
	                             	<!-- '삭제하기' 눌렀을 때 처음 봤던 게시물 해당목록 페이지로 가기 --> 
									<form action="/board/articleDelete" method="get" onsubmit="return confirm('삭제하시겠습니까?');">
										<input type="hidden" name="article_no" value="${dto.article_no}">
										<input type="hidden" name="amount" value="${cri.amount}">
	                                	<input type="hidden" name="page" value="${cri.page}">
	                                	<input type="hidden" name="type" value="${cri.type}">
	                                	<input type="hidden" name="keyword" value="${cri.keyword}">
	                                    <button class="delete_btn">삭제하기</button>
	                                 </form>       
                                 </div>       
                                   
                                 <div class="update_wrap"> 
                                 	 
	                                    <button class="update_btn" style="margin-right: 20px;"
	                                        onclick="location.href='/board/articleModifyForm?article_no=${dto.article_no}&amount=${cri.amount}&page=${cri.page}'">수정하기</button>
                          
                                 
                                 </div>       

                                

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(function() {
		$(".sub4").addClass("active");	
	})
		  
</script>
</body>
</html>