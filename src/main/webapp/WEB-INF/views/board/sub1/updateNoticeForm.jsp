<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>Update Notice Form</title>
    <link rel="stylesheet" href="/resources/css/board/sub1/notice_write_page.css">
</head>

<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/board/noticeList">열린공간</a>
                        </li>
                        <li>
                            <a href="/board/notice">공지사항</a>
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
                            
                            <fmt:formatDate var="notice_reg_date" value="${noticeContent.notice_reg_date}" pattern="yyyy-MM-dd HH:ss"/>
                            
                            <div class="table-wrap">
                                <form action="/board/updateNotice" method="post" onsubmit="return false">
                                    <input type="hidden" name="writer_id" value="writer_id">
                            		<input type="hidden" name="notice_no" value="${noticeContent.notice_no}">
                            		
                            		<input type="hidden" name="amount" value="${cri.amount}">
                                	<input type="hidden" name="page" value="${cri.page}">
                                	<input type="hidden" name="type" value="${cri.type}">
                                	<input type="hidden" name="keyword" value="${cri.keyword}">
                                    
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        value="${noticeContent.notice_title}" name="notice_title" autocomplete="off">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${noticeContent.writer_name}</td>
                                                <th class="first">작성일</th>
                                                <td>${notice_reg_date}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <textarea id="popContent" name="notice_content" cols="108"
                                                        rows="15">${noticeContent.notice_content}</textarea>
                                                </td>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">수정완료</button>
                                        <!-- <button class="list_btn" onclick="location.href='/noticeList'">목록으로</button> -->
                                    </div>
                                    
                                </form>
                                
                                <div class="list_wrap">
                                	<form action="/board/noticeList" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
<script src="https://code.jquery.com/jquery-3.6.0.js"
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
	$(function(){
		
		$(".sub1").addClass("active");
		
		
		$(".write_btn").on("click", function() {
			
			
			if(confirm('등록하시겠습니까?')) {
				$("form").attr("onsubmit", "result true");
				$("form").submit();
			}
		});
		
		
		
		
		
		
		
		
	})
	
	
	
	
	
</script>
	
	




</body>

</html>
